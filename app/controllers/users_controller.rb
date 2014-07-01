class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(allowed_params)
    if user
      user.save!
      log_user_in(user)
      redirect_to root_path
    end
  end

  private

  def allowed_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end