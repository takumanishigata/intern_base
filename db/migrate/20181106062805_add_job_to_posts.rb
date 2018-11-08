class AddJobToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :job, :text
    add_column :posts, :recommend, :text
  end
end
