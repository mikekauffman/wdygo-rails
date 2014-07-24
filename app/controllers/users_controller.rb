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

  def update
    @user = current_user
    @user.foursquare_token = auth_hash[:credentials][:token]
    @user.save
    p @user
    redirect_to user_path(@user)
  end

  def show
    @user = current_user
  end

  private

  def redirect_uri
    uri = URI.parse(request.url)
    uri.path = '/auth/foursquare/callback'
    uri.query = nil
    uri.to_s
  end

  def allowed_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end