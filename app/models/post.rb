class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :comments
  validates :name, {presence:true}
  validates :image, {presence:true}
  validates :job, {presence:true}
  validates :content, {presence:true}
  validates :recommend, {presence:true}
  def user
    return User.find_by(id: self.user_id)
  end
end
