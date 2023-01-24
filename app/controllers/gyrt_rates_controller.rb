class GyrtRatesController < ApplicationController
  before_action :set_gyrt_rate, only: %i[ show edit update destroy ]

  # GET /gyrt_rates or /gyrt_rates.json
  def index
    @gyrt_rates = GyrtRate.paginate(page: params[:page], per_page: 10)
  end

  # GET /gyrt_rates/1 or /gyrt_rates/1.json
  def show
  end

  # GET /gyrt_rates/new
  def new
    @gyrt_rate = GyrtRate.new
  end

  # GET /gyrt_rates/1/edit
  def edit
  end

  # POST /gyrt_rates or /gyrt_rates.json
  def create
    @gyrt_rate = GyrtRate.new(gyrt_rate_params)

    respond_to do |format|
      if @gyrt_rate.save
        format.html { redirect_to gyrt_rate_url(@gyrt_rate), notice: "Gyrt rate was successfully created." }
        format.json { render :show, status: :created, location: @gyrt_rate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gyrt_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gyrt_rates/1 or /gyrt_rates/1.json
  def update
    respond_to do |format|
      if @gyrt_rate.update(gyrt_rate_params)
        format.html { redirect_to gyrt_rate_url(@gyrt_rate), notice: "Gyrt rate was successfully updated." }
        format.json { render :show, status: :ok, location: @gyrt_rate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gyrt_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gyrt_rates/1 or /gyrt_rates/1.json
  def destroy
    @gyrt_rate.destroy

    respond_to do |format|
      format.html { redirect_to gyrt_rates_url, notice: "Gyrt rate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gyrt_rate
      @gyrt_rate = GyrtRate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gyrt_rate_params
      params.require(:gyrt_rate).permit(:benefit_id, :age, :rate, :rate_type)
    end
end
