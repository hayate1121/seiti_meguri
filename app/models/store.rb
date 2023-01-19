class Store < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :store_image
  
  def get_store_image(width, height)
    unless store_image.attached?
      file_path = Rails.root.join('app/assets/images/noimage-760x460.jpg')
      store_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    store_image.variant(resize_to_limit: [width, height]).processed
  end
  
end
