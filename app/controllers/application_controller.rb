class ApplicationController < ActionController::Base

  helper_method :current_user, :log_user_in

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def log_user_in(user)
    session[:id] = user.id
  end

  def log_user_out
    session.destroy
  end
end
