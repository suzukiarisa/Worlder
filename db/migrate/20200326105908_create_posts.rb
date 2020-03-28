class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.integer :user_id
      t.integer :area_id
      t.string :image_id
      t.string :title
      t.string :body
      t.datetime :updated_at
      t.datetime :created_at

      t.timestamps
    end
  end
end
