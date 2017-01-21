class HomeController < ApplicationController
  def index    
  end

  def wishlist
  	if current_user == nil
  		redirect_to '/home/error'
    else
      @user_fav = Wishlist.find_by(user_id: current_user.id)
      puts 'fav is '
      puts @user_fav
  	end  	
  end

  def add_wishlist
    puts 'insidez add_wishlist'
    relevant_furni = Furniture.find(params[:furni_id])
    relevant_user = User.find(params[:user_id])
    puts relevant_user
    puts relean_furni
    @user_fav = Wishlist.create(furni_id: relevant_furni.id, user_id: relevant_user.id)
    # redirect_to '/home/wishlist'
    redirect_to '/home/settings'
  end

  def settings
  	if current_user == nil
  		redirect_to '/home/error'
  	end
  end

  def lottery
    puts 'inside lottery'
    if current_user == nil
      redirect_to '/home/error'
    end    
  end

  def lottery_gamble
    puts 'inside lottery gamble'
    if current_user == nil
      redirect_to '/home/error'
    else
      curr_furni = current_user.furnipoints
      puts 'current furni'
      puts curr_furni
      furni_option = curr_furni + Random.rand(-50..50)
      current_user.update({furnipoints: furni_option - 10 })
      flash[:alert]= "Lottery completed. Check your new furnipoint count! :D"
      redirect_to "/home/lottery"
  	end  	
  end

  def error
  end
end
