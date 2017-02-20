module Followable
	extend ActiveSupport::Concern

	included do
	end

	def following? user
		UserFollow.where(followable: user, follower: self).first
	end

	def has_follower? user
		UserFollow.where(followable: self, follower: user).first
	end

	def following
		following_user_ids = UserFollow.where(follower: self, followable_type: "User").pluck(:followable_id)
	end

	def followers
		followed_by_user_ids = UserFollow.where(followable: self).pluck(:follower_id)
		User.where(id: followed_by_user_ids)  .order(created_at: :desc)
	end

	def follow user
		UserFollow.follow user, self
	end

	def unfollow user
		UserFollow.unfollow user, self
	end

	def user_followers_since datetime
		UserFollow.where(followable: self).where(created_at: (datetime..Time.now + 1.minute))
	end

	module ClassMethods

	end

	protected

end