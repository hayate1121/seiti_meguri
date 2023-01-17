class Photo < ApplicationRecord
  has_one_attached :image
  
  belongs_to :user
  belongs_to :anime
  belongs_to :scene
  has_many :photo_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/noimage-760x460.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
