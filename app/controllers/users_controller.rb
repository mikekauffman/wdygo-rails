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
    if current_user
    @user = current_user
    @user.foursquare_token = auth_hash[:credentials][:token]
    @user.save
    redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def show
    if current_user
      @user = current_user
    else
      redirect_to root_path
    end
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