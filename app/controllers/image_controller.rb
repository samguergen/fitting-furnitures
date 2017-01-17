class ImageController < ApplicationController
	def index
		@photos = Photo.all
	end

	def create
		foto = Photo.create!(name: "McDonald's")
		foto.image = Rails.root.join("db/images/mcdonalds_logo.png").open
		restaurant.save!
		@images = Dir.glob("Users/samanthaguergenenov/desktop/Programming/DevPortfolio/fitting-furnitures/app/assets/images/*.jpeg")
		@images.each do |i|
		  id=File.basename(i).gsub('.jpeg','');
		  t=Product.where(id:id).first;
		  t.images=[Pathname.new(i).open];
	end
end
