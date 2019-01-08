class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end


  def new
    @listing = Listing.new
  end


  def create
    @listing = Listing.new(listing_params)
    if @listing.valid?
      @listing.save
      @listing.assign_source
      @listing.assign_values
      redirect_to edit_listing_path(@listing)
    else
      render :new
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      redirect_to listing_path(@listing)
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def listing_params
    params.require(:listing).permit(:url,
                                    :street_address_one,
                                    :street_address_two,
                                    :city,
                                    :state,
                                    :zip_code,
                                    :price,
                                    :no_fee,
                                    :num_beds,
                                    :num_bath,
                                    :laundry_in_unit,
                                    :laundry_in_building,
                                    :central_air,
                                    :description,
                                    :has_dishwasher,
                                    :neighborhood,
                                    :package_handling,
                                    :guarantors_accepted,
                                    :source)
  end
end
