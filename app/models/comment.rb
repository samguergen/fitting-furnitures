class Comment < ActiveRecord::Base
	# has_secure_password
	belongs_to :user
	belongs_to :furniture
end
