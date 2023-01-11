class Anime < ApplicationRecord
  has_one_attached :anime_image
  
  has_many :photos, dependent: :destroy
  has_many :scenes, dependent: :destroy
  has_many :stores, dependent: :destroy
  
  def get_anime_image(width, height)
    unless anime_image.attached?
      file_path = Rails.root.join('app/assets/images/noimage-760x460.jpg')
      anime_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    anime_image.variant(resize_to_limit: [width, height]).processed
  end
  
end
