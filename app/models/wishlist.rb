class Wishlist < ActiveRecord::Base
  belongs_to :furniture
  belongs_to :user
end
