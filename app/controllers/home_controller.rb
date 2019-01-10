class HomeController < ApplicationController
  def landing
    if current_user
      @listings = current_user.listings
      render :home
    else
      render :landing
    end
  end
end
