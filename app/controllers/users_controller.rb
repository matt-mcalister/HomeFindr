class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, :authenticate_user!

    def get_user_info
      user = User.find_by(email: params[:email])
      if user
        render json: {user: user.to_json}
      else
        render json: {user: "User Not Found"}
      end
    end
end
