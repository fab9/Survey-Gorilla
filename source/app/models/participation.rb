class Participation < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :taker, class_name: "User"
  belongs_to :survey
  has_many :responses
end
