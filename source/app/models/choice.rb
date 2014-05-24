class Choice < ActiveRecord::Base
  # Remember to create a migration!
  validates :text, presence: true
  belongs_to :question
  has_many :responses
end
