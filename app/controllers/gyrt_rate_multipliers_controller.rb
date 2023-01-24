class GyrtRateMultipliersController < ApplicationController
  before_action :set_gyrt_rate_multiplier, only: %i[ show edit update destroy ]

  # GET /gyrt_rate_multipliers or /gyrt_rate_multipliers.json
  def index
    @gyrt_rate_multipliers = GyrtRateMultiplier.all
  end

  # GET /gyrt_rate_multipliers/1 or /gyrt_rate_multipliers/1.json
  def show
  end

  # GET /gyrt_rate_multipliers/new
  def new
    @gyrt_rate_multiplier = GyrtRateMultiplier.new
  end

  # GET /gyrt_rate_multipliers/1/edit
  def edit
  end

  # POST /gyrt_rate_multipliers or /gyrt_rate_multipliers.json
  def create
    @gyrt_rate_multiplier = GyrtRateMultiplier.new(gyrt_rate_multiplier_params)

    respond_to do |format|
      if @gyrt_rate_multiplier.save
        format.html { redirect_to gyrt_rate_multiplier_url(@gyrt_rate_multiplier), notice: "Gyrt rate multiplier was successfully created." }
        format.json { render :show, status: :created, location: @gyrt_rate_multiplier }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gyrt_rate_multiplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gyrt_rate_multipliers/1 or /gyrt_rate_multipliers/1.json
  def update
    respond_to do |format|
      if @gyrt_rate_multiplier.update(gyrt_rate_multiplier_params)
        format.html { redirect_to gyrt_rate_multiplier_url(@gyrt_rate_multiplier), notice: "Gyrt rate multiplier was successfully updated." }
        format.json { render :show, status: :ok, location: @gyrt_rate_multiplier }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gyrt_rate_multiplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gyrt_rate_multipliers/1 or /gyrt_rate_multipliers/1.json
  def destroy
    @gyrt_rate_multiplier.destroy

    respond_to do |format|
      format.html { redirect_to gyrt_rate_multipliers_url, notice: "Gyrt rate multiplier was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gyrt_rate_multiplier
      @gyrt_rate_multiplier = GyrtRateMultiplier.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gyrt_rate_multiplier_params
      params.require(:gyrt_rate_multiplier).permit(:benefit_id, :min_count, :max_count, :rate)
    end
end
