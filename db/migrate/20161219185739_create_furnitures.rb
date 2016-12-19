class CreateFurnitures < ActiveRecord::Migration
  def change
    create_table :furnitures do |t|
      t.string :name
      t.string :description
      t.string :image
      t.string :measurement
      t.integer :furnipoints

      t.timestamps null: false
    end
  end
end
