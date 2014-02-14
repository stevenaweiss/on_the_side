class SessionsController < ApplicationController


  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && (user.authenticate(params[:password]) ) 
      #save the user id in the session has h
      session[:user_id] = user.id
      #redirect to that users home page
      redirect_to( user_path(user) )
    else
      
      #@message = "We don't have that combo!"
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end


end
