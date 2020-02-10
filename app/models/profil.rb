class Profil < ApplicationRecord
  validates :user_id, presence: true
  validates :image, presence: true
  validates :description, presence: true
end
