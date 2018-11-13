class AddRatingToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :rating, :integer
  end
end
