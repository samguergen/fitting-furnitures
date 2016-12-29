class Furniture < ActiveRecord::Base
	has_secure_password
	belongs_to :user
	has_many :comments
end
