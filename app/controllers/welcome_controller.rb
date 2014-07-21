class WelcomeController < ApplicationController
  def index
    @user = current_user
    @auth_url = "https://foursquare.com/oauth2/authenticate?client_id=#{ENV['CLIENT_ID']}&response_type=code&redirect_uri=#{redirect_uri}"
  end

  private

  def redirect_uri
    uri = URI.parse(request.url)
    uri.path = '/auth/foursquare/callback'
    uri.query = nil
    uri.to_s
  end

end