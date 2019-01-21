class HuntsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @hunts = current_user.hunts_with_users
  end

  def add_user
    found_user = User.find_by(email: params[:email])
    if found_user && Hunt.find(params[:hunt_id])
      UserHunt.create(user_id: found_user.id, hunt_id: params[:hunt_id])
      render json: {user: found_user, not_found: false}
    else
      render json: {not_found: true}
    end
  end

  def create
    byebug
  end

  def update
    byebug
  end

  def destroy
    byebug
  end
end
