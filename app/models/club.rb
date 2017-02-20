class Club < ActiveRecord::Base
	include Followable
	belongs_to :user
	#has_many :notifications, as: "notifiable", dependent: :destroy
	#has_many :comments, as: "commentable", dependent: :destroy

	validates :name, presence: true
	validates_presence_of :user
end