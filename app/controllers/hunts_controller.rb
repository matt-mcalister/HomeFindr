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
    hunt = Hunt.new(name: params[:hunt][:name])
    if hunt.valid? && User.find(params[:user_id])
      hunt.save
      UserHunt.create(hunt_id: hunt.id, user_id: params[:user_id])
      render json: {hunts: current_user.hunts_with_users}
    else
      render json: {errors: hunt.errors.full_messages}
    end
  end

  def destroy
    byebug
  end
end
