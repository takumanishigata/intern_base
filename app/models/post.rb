class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :user_id, {presence:true}

  def user
    return User.find_by(id: self.user_id)
  end
end
