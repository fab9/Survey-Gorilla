class Survey < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :creator, class_name: "User"
  has_many :participations
  has_many :takers, through: :participations, source: :user
  has_many :questions
end
