class GyrtLoadingsController < ApplicationController
  before_action :set_gyrt_loading, only: %i[ show edit update destroy ]

  # GET /gyrt_loadings or /gyrt_loadings.json
  def index
    @gyrt_loadings = GyrtLoading.all
  end

  # GET /gyrt_loadings/1 or /gyrt_loadings/1.json
  def show
  end

  # GET /gyrt_loadings/new
  def new
    @gyrt_loading = GyrtLoading.new
  end

  # GET /gyrt_loadings/1/edit
  def edit
  end

  # POST /gyrt_loadings or /gyrt_loadings.json
  def create
    @gyrt_loading = GyrtLoading.new(gyrt_loading_params)

    respond_to do |format|
      if @gyrt_loading.save
        format.html { redirect_to gyrt_loading_url(@gyrt_loading), notice: "Gyrt loading was successfully created." }
        format.json { render :show, status: :created, location: @gyrt_loading }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gyrt_loading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gyrt_loadings/1 or /gyrt_loadings/1.json
  def update
    respond_to do |format|
      if @gyrt_loading.update(gyrt_loading_params)
        format.html { redirect_to gyrt_loading_url(@gyrt_loading), notice: "Gyrt loading was successfully updated." }
        format.json { render :show, status: :ok, location: @gyrt_loading }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gyrt_loading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gyrt_loadings/1 or /gyrt_loadings/1.json
  def destroy
    @gyrt_loading.destroy

    respond_to do |format|
      format.html { redirect_to gyrt_loadings_url, notice: "Gyrt loading was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gyrt_loading
      @gyrt_loading = GyrtLoading.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gyrt_loading_params
      params.require(:gyrt_loading).permit(:name, :rate)
    end
end
