class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|

      t.string :name
      t.datetime :updated_at
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
