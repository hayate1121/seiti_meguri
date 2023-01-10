class Scene < ApplicationRecord
  has_one_attached :scene_image
  
  has_many :photos, dependent: :destroy
  belongs_to :anime
  
end
