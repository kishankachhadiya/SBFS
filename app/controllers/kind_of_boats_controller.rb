class KindOfBoatsController < ApplicationController
  before_action :set_kind_of_boat, only: [:show, :edit, :update, :destroy]

  # GET /kind_of_boats
  # GET /kind_of_boats.json
  def index
    @kind_of_boats = KindOfBoat.all
  end

  # GET /kind_of_boats/1
  # GET /kind_of_boats/1.json
  def show
  end

  # GET /kind_of_boats/new
  def new
    @kind_of_boat = KindOfBoat.new
  end

  # GET /kind_of_boats/1/edit
  def edit
  end

  # POST /kind_of_boats
  # POST /kind_of_boats.json
  def create
    @kind_of_boat = KindOfBoat.new(kind_of_boat_params)

    respond_to do |format|
      if @kind_of_boat.save
        format.html { redirect_to @kind_of_boat, notice: 'Kind of boat was successfully created.' }
        format.json { render :show, status: :created, location: @kind_of_boat }
      else
        format.html { render :new }
        format.json { render json: @kind_of_boat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kind_of_boats/1
  # PATCH/PUT /kind_of_boats/1.json
  def update
    respond_to do |format|
      if @kind_of_boat.update(kind_of_boat_params)
        format.html { redirect_to @kind_of_boat, notice: 'Kind of boat was successfully updated.' }
        format.json { render :show, status: :ok, location: @kind_of_boat }
      else
        format.html { render :edit }
        format.json { render json: @kind_of_boat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kind_of_boats/1
  # DELETE /kind_of_boats/1.json
  def destroy
    @kind_of_boat.destroy
    respond_to do |format|
      format.html { redirect_to kind_of_boats_url, notice: 'Kind of boat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kind_of_boat
      @kind_of_boat = KindOfBoat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kind_of_boat_params
      params.require(:kind_of_boat).permit(:kind)
    end
end
