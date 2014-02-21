class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


 def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

 def admin?
    if logged_in?
      current_user.admin
    else 
      false
    end
  end 

  # if logged_in? && admin?
  #   display stuff

  helper_method :current_user, :logged_in?, :admin?
end