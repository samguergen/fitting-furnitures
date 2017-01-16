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
    puts 'inside lottery'
    if current_user == nil
      redirect_to '/home/error'
    end    
  end

  def lottery_gamble
    puts 'inside lottery'
    if current_user == nil
      redirect_to '/home/error'
    else
      curr_furni = current_user.furnipoints
      puts 'current furni'
      puts curr_furni
      furni_opt = [(curr_furni + 30), (curr_furni - 50), (curr_furni +50), (curr_furni - 30)]
      current_user.update({furnipoints: furni_opt[3] - 10 })
      flash[:alert]= "Lottery completed. Check your new furnipoint count! :D"
      redirect_to "/home/lottery"
  	end  	
  end

  def error
  end
end
