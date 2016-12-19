class CreateFurnitures < ActiveRecord::Migration
  def change
    create_table :furnitures do |t|
      t.string :name
      t.text :content
      t.string :condition
      t.string :dimensions
      t.string :image_url
      t.integer :furnipoints

      t.timestamps null: false
    end
  end
end
