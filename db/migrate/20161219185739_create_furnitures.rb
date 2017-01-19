class CreateFurnitures < ActiveRecord::Migration
  def change
    create_table :furnitures do |t|
      t.string :name
      t.text :content
      t.string :condition
      t.string :dimensions
      t.string :image
      t.integer :furnipoints
      t.references :user

      t.timestamps null: false
    end
  end
end
