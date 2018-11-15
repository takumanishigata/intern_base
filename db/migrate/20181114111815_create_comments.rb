class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :title
      t.integer :rating
      t.text :content
      t.text :job
      t.text :recommend
      t.integer :user_id
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
