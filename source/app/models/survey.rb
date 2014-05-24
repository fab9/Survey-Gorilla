class Survey < ActiveRecord::Base
mount_uploader :image_url, PhotoUploader

  belongs_to :creator, class_name: "User"
  has_many :participations
  has_many :takers, through: :participations
  has_many :questions


end
