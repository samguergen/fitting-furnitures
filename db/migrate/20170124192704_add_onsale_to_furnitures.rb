class AddOnsaleToFurnitures < ActiveRecord::Migration
  def change
    add_column :furnitures, :onsale, :boolean, default: true
  end
end
