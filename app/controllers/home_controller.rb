class HomeController < ApplicationController
  def index    
  end

#function to remove multiples from user_fav
#when joint table replaced by 12many, check for doubles in if sttemnt
  def add_wishlist
    puts 'insidez add_wishlist'
    relevant_furni = Furniture.find(params[:furniture_id])
    relevant_user = User.find(params[:user_id])
    puts relevant_user
    puts current_user
    puts relevant_furni
    if relevant_user == nil
      puts 'already wishlist'
      flash[:alert] = "You already added this item to your wishlist!"
      # redirect_to '/home/wishlist'
    else
      puts 'creating new wishlist'
      wishlist = Wishlist.create(furniture_id: relevant_furni.id, user_id: relevant_user.id)
      if wishlist.save
        @user_fav = Wishlist.where(user_id: session[:user_id])
        puts 'user_fav is'
        puts @user_fav
      else
        flash[:alert] = "Wishlist couldn't be saved"
      end
    end
    redirect_to '/home/wishlist'
  end

  def wishlist
    if current_user == nil
      redirect_to '/home/error'
    else
      @user_fav = Wishlist.where(user_id: current_user.id)
      @fav_furnis = []
      @user_fav.each do |fav|
        furni = Furniture.find(fav.furniture_id)
        @fav_furnis << furni
      end
      @fav_furnis = @fav_furnis.uniq
      return @fav_furnis
    end   
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
