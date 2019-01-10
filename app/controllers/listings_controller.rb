class ListingsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @listings = Listing.all
  end


  def create
    byebug
    listing = Listing.find_or_initialize_by(url: listing_params[:url])
    if listing.valid?
      listing.save
      if listing.update(listing_params)
        render json: {success: true}
      else
        render json: {errors: listing.errors}
      end
    else
      render json: {errors: listing.errors}
    end
  end


  def destroy
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
                                    :url)
  end
end
