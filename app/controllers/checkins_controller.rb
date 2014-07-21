class CheckinsController < ApplicationController
  def index
    user = current_user
    checkin = Checkin.new
    @checkins_list = checkin.get_checkins(user)
  end

  def map
    user = current_user
    checkin = Checkin.new
    @checkins_list = checkin.get_checkins(user)
  end
end