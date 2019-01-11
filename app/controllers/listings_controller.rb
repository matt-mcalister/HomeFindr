class ListingsController < ApplicationController
  skip_before_action :verify_authenticity_token, :authenticate_user!
  def index
    @listings = Listing.all
  end

  def search
    user = User.find_by(email: params[:email])
    if !!user
      listing = user.listings.find {|l| l.url == params[:url]}
      render json: {listing: listing}
    else
      render json: {errors: ["You must create an account before adding favorites!"]}
    end
  end


  def create
    user = User.find_by(email: params[:email])
    if !!user
      listing = Listing.find_or_initialize_by(url: listing_params[:url])
      if params[:hunt_id] == "Create New Hunt"
        listing.hunt = Hunt.create(name: "My New Hunt")
      else
        listing.hunt_id = params[:hunt_id]
      end
      if listing.valid?
        listing.save
        if listing.update(listing_params)
          render json: {listing: listing}
        else
          render json: {errors: listing.errors}
        end
      else
        render json: {errors: listing.errors}
      end
    else
      render json: {errors: ["You must create an account before adding favorites!"]}
    end
  end


  def destroy
    Listing.find(params[:id]).destroy
  end

  private
  def listing_params
    params.require(:listing).permit(:street_address,
                                    :city,
                                    :state,
                                    :zip_code,
                                    :neighborhood,
                                    :price,
                                    :num_beds,
                                    :num_bath,
                                    :no_fee,
                                    :dishwasher,
                                    :guarantors_accepted,
                                    :outdoor_space,
                                    :laundry_in_unit,
                                    :laundry_in_building,
                                    :doorman,
                                    :package_handling,
                                    :elevator,
                                    :gym,
                                    :url,
                                    :notes)
  end
end
