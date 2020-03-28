class CreatePostAreaRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :post_area_relations do |t|

      t.timestamps
    end
  end
end
