# == Schema Information
#
# Table name: user_follows
#
#  id              :integer          not null, primary key
#  follower_id     :integer
#  followable_id   :integer          not null
#  followable_type :string(50)
#  created_at      :datetime
#  updated_at      :datetime
#

class UserFollow < ActiveRecord::Base
	validates_presence_of :followable, :follower
	validates :follower_id, uniqueness: { scope: [:followable_id, :followable_type] }
	validate :cannot_follow_self
	include Followable

	belongs_to :followable, polymorphic: true
	belongs_to :follower, class_name: User, foreign_key: :follower_id

	def self.follow followable, follower
		UserFollow.create(followable: followable, follower: follower)
	end

	def self.unfollow followable, follower
		user_follow = UserFollow.where(followable: followable, follower: follower).first
		user_follow.destroy if user_follow
	end

	private

	def cannot_follow_self
		errors.add(:base, 'You cannot follow yourself.') if (followable_id == follower_id && followable_type == "User")
	end

end
