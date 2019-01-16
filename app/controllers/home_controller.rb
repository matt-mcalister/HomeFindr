class HomeController < ApplicationController
  def landing
    if current_user
      @hunts = current_user.hunts_with_listings
      render :home
    else
      render :landing
    end
  end
end
