class Anime < ApplicationRecord
  has_one_attached :anime_image
  
  has_many :photos, dependent: :destroy
  has_many :scenes, dependent: :destroy
  has_many :stores, dependent: :destroy
  
end
