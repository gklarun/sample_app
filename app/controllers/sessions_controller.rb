class SessionsController < ApplicationController

  def new
  end

  def create

      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        # Sign the user in and redirect to the user's show page.
        if user.email_confirmed
        sign_in user
        redirect_to user
        else
          flash.now[:error] = 'Please activate your account by following the instructions in the account confirmation email you received to proceed'
          render 'new'
        end
      else
        flash[:error] = 'Invalid email/password combination' # Not quite right!
        render 'new'
      end

  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
