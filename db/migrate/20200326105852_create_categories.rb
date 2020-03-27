class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|

      t.integer :user_id
      t.integer :post_id
      t.string :name
      t.datetime :updated_at
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
