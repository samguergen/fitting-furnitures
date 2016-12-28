class SessionsController < ApplicationController

#post
  def login
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
    end
    redirect_to '/'
  end

#destroy
  def logout
    session[:user_id] = nil
    redirect_to '/'
  end

end