class User < ActiveRecord::Base

  include Followable
  before_create :create_remember_token
  before_create :confirmation_token
  before_save { self.email = email.downcase }
  validates :first_name,  presence: true, length: { maximum: 50 }
  validates :last_name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX } ,uniqueness: {case_sensitive: false}
  validates :password, length: { minimum: 6 }
  has_many :clubs, dependent: :destroy
  has_secure_password

  mount_uploader :photo, ProfilePhotoUploader
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  def full_name
    self.first_name + " " + self.last_name
  end

  private

  def create_remember_token
   # puts "haiiii"
    self.remember_token = User.digest(User.new_remember_token)
  end

  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end