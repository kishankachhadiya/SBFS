class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy, :like]
  before_action :set_manufacturers, except: [:show, :destroy]
  before_action :is_admin!, except: [:index, :show, :edit, :update, :like]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /listings
  # GET /listings.json
  def index
    set_listings_and_manufacturer_with_criteria(params[:manufacturer], params[:order], '')
  end

  def search
    set_listings_and_manufacturer_with_criteria(params[:manufacturer], params[:order], params[:state])
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
    @listing.user = current_user

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

  def like
    if current_user.voted_for? @listing
      @listing.unliked_by current_user
    else
      @listing.liked_by current_user
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

  def set_states
    @states = State.all
  end

  # Only allow a list of trusted parameters through.
  def listing_params
    params.require(:listing).permit(:title, :description, :equipment, :model, :featured, :length, :beam, :draft, :displacement, :year, :cabins, :berths, :engine, :fuel, :hours, :horsepower, :location, :zip_code, :public_name, :email, :phone_number, :price, :published, :thumbnail, images: [], manufacturer_ids: [], state_ids: [])
  end

  def set_listings_and_manufacturer_with_criteria(requested_manufacturer, requested_order, requested_state)
    if requested_manufacturer.nil? || requested_manufacturer.eql?('All')
      listings_by_manufacturer = Listing.all
      @manufacturer_name = 'All'
    else
      listings_by_manufacturer = filter_listings_by_manufacturer(requested_manufacturer)
      @manufacturer_name = requested_manufacturer
    end
    
    if requested_state == '' || requested_state.nil? || requested_state.eql?('All')
      listings_by_state = listings_by_manufacturer
    else
      listings_by_state = filter_listings_by_state(requested_state, listings_by_manufacturer)
    end
    @order = requested_order
    order_listings(requested_order, listings_by_state)
  end

  def filter_listings_by_manufacturer(manufacturer_name)
    @manufacturer = Manufacturer.find_by(name: manufacturer_name)
    listings = if @manufacturer.nil?
                Listing.none
                else
                  @manufacturer.listings
                end
  end

  def filter_listings_by_state(state_name, listings_by_manufacturer)
    @manufacturer = State.find_by(state: state_name)
    listings = if @manufacturer.nil?
             # Listing.none
           else
             @manufacturer.listings.where(id: listings_by_manufacturer.pluck(:id))

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