
class Comment < ActiveRecord::Base
	#Comments belong to a master object (commentable), for example a trip
	#Comments may also be a reply to another comment (replyable)

	belongs_to :commentable, polymorphic: true
	belongs_to :replyable, polymorphic: true
	has_many :replies, :class_name => "Comment", :as => :replyable, dependent: :destroy
	belongs_to :user
	acts_as_voteable
	validates :comment, :user, :commentable, presence: true
	has_many :notifications, as: "notifiable", dependent: :destroy

	def comment_like_string
		voters = self.voters_who_voted
		if voters.count > 2
			" #{voters.last}, #{voters.last(2)[0]} and #{voters.count-2} others"
		elsif voters.count == 2
			" #{voters.last} and #{voters.last(2)[0]} liked"
		elsif voters.count == 1
			" #{voters.last} liked"
		end
	end

end
