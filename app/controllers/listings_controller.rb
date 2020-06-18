class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :set_manufacturers, except: [:show, :destroy]

  # GET /listings
  # GET /listings.json
  def index
    set_listings_and_manufacturer_with_criteria(params[:manufacturer], '')
  end

  def search
    set_listings_and_manufacturer_with_criteria(params[:manufacturer], params[:order])
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_listing
    @listing = Listing.find(params[:id])
  end

  def set_manufacturers
    @manufacturers = Manufacturer.all
  end

  # Only allow a list of trusted parameters through.
  def listing_params
    params.require(:listing).permit(:title, :description, :equipment, :model, :length, :beam, :draft, :displacement, :year, :cabins, :berths, :engine, :fuel, :hours, :horsepower, :location, :zip_code, :public_name, :email, :phone_number, :published, :thumbnail, manufacturer_ids: [])
  end

  def set_listings_and_manufacturer_with_criteria(requested_manufacturer, requested_order)
    if requested_manufacturer.nil? || requested_manufacturer.eql?('All')
      listings_by_manufacturer = Listing.all
      @manufacturer_name = 'All'
    else
      listings_by_manufacturer = filter_listings_by_manufacturer(requested_manufacturer)
      @manufacturer_name = requested_manufacturer
    end
    order_listings(requested_order, listings_by_manufacturer)
  end
  def filter_listings_by_manufacturer(manufacturer_name)
    @manufacturer = Manufacturer.find_by(name: manufacturer_name)
    listings = if @manufacturer.nil?
                Listing.none
                else
                  @manufacturer.listings
                end
  end

  def order_listings(_order, _listings)
    @listings = case _order
              when 'A-Z'
                _listings.order('title ASC')
              when 'Z-A'
                _listings.order('title DESC')
              when 'Highest Priced'
                _listings.order('price DESC')
              when 'Lowest Priced'
                _listings.order('price ASC')
              when 'Newest Listings'
                _listings.order('created_at DESC')
              when 'Oldest Listings'
                _listings.order('created_at ASC')
              else
                _listings.order('title ASC')
              end
  end
end