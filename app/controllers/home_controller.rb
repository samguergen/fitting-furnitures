class HomeController < ApplicationController
  def index
  end

  def wishlist
  	if current_user == nil
  		redirect_to '/home/error'
  	end  	
  end

  def settings
  	if current_user == nil
  		redirect_to '/home/error'
  	end
  end

  def lottery
  	if current_user == nil
  		redirect_to '/home/error'
  	end  	
  end

  def error
  end
end
