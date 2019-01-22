class HomeController < ApplicationController
  def landing
    if current_user
      @hunts = current_user.hunts_with_listings
      if !current_user.hunts.last
        redirect_to hunts_path
      else
        if params[:hunt] && hunt = Hunt.find_by(name: params[:hunt])
          @selected_hunt_id = hunt.id
        else
          @selected_hunt_id = current_user.hunts.last.id
        end
        render :home
      end
    else
      render :landing
    end
  end
end
