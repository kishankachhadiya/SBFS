class RiggingsController < ApplicationController
  before_action :set_rigging, only: [:show, :edit, :update, :destroy]

  # GET /riggings
  # GET /riggings.json
  def index
    @riggings = Rigging.all
  end

  # GET /riggings/1
  # GET /riggings/1.json
  def show
  end

  # GET /riggings/new
  def new
    @rigging = Rigging.new
  end

  # GET /riggings/1/edit
  def edit
  end

  # POST /riggings
  # POST /riggings.json
  def create
    @rigging = Rigging.new(rigging_params)

    respond_to do |format|
      if @rigging.save
        format.html { redirect_to @rigging, notice: 'Rigging was successfully created.' }
        format.json { render :show, status: :created, location: @rigging }
      else
        format.html { render :new }
        format.json { render json: @rigging.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /riggings/1
  # PATCH/PUT /riggings/1.json
  def update
    respond_to do |format|
      if @rigging.update(rigging_params)
        format.html { redirect_to @rigging, notice: 'Rigging was successfully updated.' }
        format.json { render :show, status: :ok, location: @rigging }
      else
        format.html { render :edit }
        format.json { render json: @rigging.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /riggings/1
  # DELETE /riggings/1.json
  def destroy
    @rigging.destroy
    respond_to do |format|
      format.html { redirect_to riggings_url, notice: 'Rigging was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rigging
      @rigging = Rigging.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rigging_params
      params.require(:rigging).permit(:rigging)
    end
end
