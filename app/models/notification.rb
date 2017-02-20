

class Notification < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :user
	belongs_to :notifiable, polymorphic: true
	validates :notifiable, presence: true

	# ensure the is_read field is either true or false. Note, can't use presence validation here since does
	# not support booleans
	validates_inclusion_of :is_read, in:[true, false]

	def mark_as_read
		self.update_attribute(:is_read, true)
	end

	def decrement_counter
		if !counter
			self.update_attribute(:counter, 0)
		elsif self.counter > 0
			self.update_attribute(:counter, self.counter - 1)
		end
	end

	def increment_counter
		if counter
			self.update_attribute(:counter, self.counter + 1)
		else
			self.update_attribute(:counter, 1)
		end
	end

	def update_counter new_count
		if new_count >= 0
			self.update_attribute(:counter, new_count)
		end
	end


	def unread?
		!is_read?
	end

	#subclass will implement own class method if needed. If subclass is set to false, the is_read variable must
	#be set manually and will not be set to true on a notification/index page view
	def is_read_markable?
		true
	end

	def self.perform_update(args = {})
		raise "Notification#perform_update not defined for this notification"
	end

	def self.trigger(args = {})
		raise "Notification#trigger not defined for this notification"
	end
end

