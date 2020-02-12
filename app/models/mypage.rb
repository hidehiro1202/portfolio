class Mypage < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  
  mount_uploader :image, ImageUploader
  
  belongs_to :user
end
