class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      log_user_in(user)
      flash[:success] = "Login Successful"
      redirect_to root_path
    else
      flash.now[:error] = "Invalid Email and Password Combination"
      render "new"
    end
  end

  def destroy
    log_user_out
    flash[:success] = "Logout Successful"
    redirect_to root_path
  end
end