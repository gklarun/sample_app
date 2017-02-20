class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  #before_filter :authenticate_user!, unless: :white_list_controller

  private

  def authenticate_user!
    if signed_in?
    else
      flash[:footer_message] = "Let's sign you in."
      redirect_to new_session_path
    end

  end

  def white_list_controller
    if (self.is_a?(SessionsController)) ||
      (self.is_a?(ClubsController) && action_name == "show") ||
      (self.is_a?(UsersController) && action_name == "show") ||
      true
    else
      false
    end
  end


end
