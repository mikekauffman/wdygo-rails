class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  helper_method :current_user, :log_user_in

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def log_user_in(user)
    session[:id] = user.id
  end
end
