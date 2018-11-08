class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :email, {uniqueness:true}
end
