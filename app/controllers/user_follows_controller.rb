class UserFollowsController < ApplicationController
	before_filter :get_followable

	def show
		if params[:followers]
			@followers = @followable.followers
			@prompt_modal = PromptModal.new(partial: "user_follows/followers")
		elsif params[:following]
			@following = @followable.following
			@prompt_modal = PromptModal.new(partial: "user_follows/following")
		end
		respond_to do |format|
			format.js {render partial: "render_notifications" and return}
		end
	end

	def create
		current_user.follow @followable
		#NewFollowerNotification.perform_update @followable, current_user
		respond_to do |format|
			format.js {render :update}
		end
	end

	def destroy
		current_user.unfollow @followable
		#NewFollowerNotification.perform_update @followable, current_user
		respond_to do |format|
			format.js {render :update}
		end
	end

	private

	def get_followable
		klass = Object.const_get(params[:followable_type])
		id = params[:id]
		@followable = klass.find(id)
	rescue
		flash[:footer_message] = "Error when following :("
		respond_to do |format|
			format.js {render partial: "render_notifications" and return}
		end
	end

end
