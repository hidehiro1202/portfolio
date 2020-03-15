class Spot < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :favorites
    has_many :favorite_users, through: :favorites, source: 'user'
    
    has_many :clears
    has_many :clear_users, through: :clears, source: 'user'
end
