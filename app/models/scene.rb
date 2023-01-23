class Scene < ApplicationRecord
  has_one_attached :scene_image
  
  has_many :photos, dependent: :destroy
  belongs_to :anime
  
  geocoded_by :scene_address
  after_validation :geocode, if: :scene_address_changed?
  
  def get_scene_image(width, height)
    unless scene_image.attached?
      file_path = Rails.root.join('app/assets/images/noimage-760x460.jpg')
      scene_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    scene_image.variant(resize_to_limit: [width, height]).processed
  end
  
end
