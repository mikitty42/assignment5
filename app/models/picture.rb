class Picture < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :content,presence: true
  has_many :favorites,dependent: :destroy
  has_many :favorite_users,through: :favorites,source: :user
end
