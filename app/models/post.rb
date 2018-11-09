class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :user_id, {presence:true}
end
