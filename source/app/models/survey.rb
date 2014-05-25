class Survey < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :creator, class_name: "User"
  has_many :participations
  has_many :takers, through: :participations
  has_many :questions
end
