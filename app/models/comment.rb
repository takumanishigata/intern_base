class Comment < ApplicationRecord
  belongs_to :post, optional: true
  
  validates :title, {presence:true}
  validates :job, {presence:true}
  validates :content, {presence:true}
  validates :recommend, {presence:true}
end