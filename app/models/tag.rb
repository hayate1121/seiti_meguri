class Tag < ApplicationRecord
  has_many :tagmaps, dependent: :destroy
  has_many :animes, through: :tagmaps
end
