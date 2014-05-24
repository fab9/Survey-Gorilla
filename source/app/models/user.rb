class User < ActiveRecord::Base

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\w+@\w+\.\w{2,}/}
  validates :password_hash, presence: true

  has_many :created_surveys, class_name: "Survey", foreign_key: :creator_id
  has_many :participations, foreign_key: :taker_id
  has_many :taken_surveys, through: :participations, source: :survey

  include BCrypt
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @entered_password = pass
    @password = Password.create(pass)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return user if user && (user.password == password)
    nil # either invalid email or wrong password
  end
end
