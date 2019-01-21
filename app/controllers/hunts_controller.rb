class HuntsController < ApplicationController

  def index
    @hunts = current_user.hunts_with_users
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
