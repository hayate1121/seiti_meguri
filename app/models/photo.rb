class Photo < ApplicationRecord
  has_one_attached :image
  
  belongs_to :user
  belongs_to :anime
  belongs_to :scene
  
end
