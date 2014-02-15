class SessionsController < ApplicationController


  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && (user.authenticate(params[:password]) ) 
      
      session[:user_id] = user.id
      
      redirect_to( user_path(user) )  #or to index or wherever
    else
      #render :text => "Wrong"
      #@message = "We don't have that combo!"
      redirect_to root_path
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end


end
