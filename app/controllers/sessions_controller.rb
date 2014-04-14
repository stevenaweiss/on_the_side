class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && (user.authenticate(params[:password]) ) 
      
      session[:user_id] = user.id
      redirect_to( user_path(user) ) 
    else
      flash[:login_error] = "Sorry, we don't have that combo"
      redirect_to login_path
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end


end
