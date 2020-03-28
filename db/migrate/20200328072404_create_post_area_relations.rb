class CreatePostAreaRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :post_area_relations do |t|

      t.integer :area_id, null: false
      t.integer :post_id, null: false
      t.datetime "deleted_at"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false

      t.timestamps
    end
  end
end
