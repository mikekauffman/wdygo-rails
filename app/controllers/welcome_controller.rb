class WelcomeController < ApplicationController
  def index
    @user = current_user
  end

  private

end