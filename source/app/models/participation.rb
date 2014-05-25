class Participation < ActiveRecord::Base
  validates_uniqueness_of :taker_id, :scope => :survey_id
  belongs_to :taker, class_name: "User"
  belongs_to :survey
  has_many :responses
end
