class User < ActiveRecord::Base
	has_secure_password
	has_many :furnitures

	mount_uploader :image, ImageUploader
end
