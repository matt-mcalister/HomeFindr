class HomeController < ApplicationController
  def landing
    if current_user
      redirect_to listings_path
    else
      render :landing
    end
  end
end
