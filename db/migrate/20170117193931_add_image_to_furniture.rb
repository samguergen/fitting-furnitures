class AddImageToFurniture < ActiveRecord::Migration
  def change
	rename_column(:furnitures, :image_url, :image) 	
  end
end