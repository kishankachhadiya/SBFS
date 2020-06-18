class HullsController < ApplicationController
  before_action :set_hull, only: [:show, :edit, :update, :destroy]

  # GET /hulls
  # GET /hulls.json
  def index
    @hulls = Hull.all
  end

  # GET /hulls/1
  # GET /hulls/1.json
  def show
  end

  # GET /hulls/new
  def new
    @hull = Hull.new
  end

  # GET /hulls/1/edit
  def edit
  end

  # POST /hulls
  # POST /hulls.json
  def create
    @hull = Hull.new(hull_params)

    respond_to do |format|
      if @hull.save
        format.html { redirect_to @hull, notice: 'Hull was successfully created.' }
        format.json { render :show, status: :created, location: @hull }
      else
        format.html { render :new }
        format.json { render json: @hull.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hulls/1
  # PATCH/PUT /hulls/1.json
  def update
    respond_to do |format|
      if @hull.update(hull_params)
        format.html { redirect_to @hull, notice: 'Hull was successfully updated.' }
        format.json { render :show, status: :ok, location: @hull }
      else
        format.html { render :edit }
        format.json { render json: @hull.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hulls/1
  # DELETE /hulls/1.json
  def destroy
    @hull.destroy
    respond_to do |format|
      format.html { redirect_to hulls_url, notice: 'Hull was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hull
      @hull = Hull.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hull_params
      params.require(:hull).permit(:hull)
    end
end
