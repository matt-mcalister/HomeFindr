class HomeController < ApplicationController
  def landing
    if current_user
      @hunts = current_user.hunts_with_listings
      @selected_hunt_id = current_user.hunts.last.id
      render :home
    else
      render :landing
    end
  end
end
