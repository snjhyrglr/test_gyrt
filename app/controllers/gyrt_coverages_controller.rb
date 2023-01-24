class GyrtCoveragesController < ApplicationController
  before_action :set_gyrt_coverage, only: %i[ show edit update destroy ]

  # GET /gyrt_coverages or /gyrt_coverages.json
  def index
    @gyrt_coverages = GyrtCoverage.all
  end

  # GET /gyrt_coverages/1 or /gyrt_coverages/1.json
  def show
  end

  # GET /gyrt_coverages/new
  def new
    @gyrt_coverage = GyrtCoverage.new
  end

  # GET /gyrt_coverages/1/edit
  def edit
  end

  # POST /gyrt_coverages or /gyrt_coverages.json
  def create
    @gyrt_coverage = GyrtCoverage.new(gyrt_coverage_params)

    respond_to do |format|
      if @gyrt_coverage.save
        format.html { redirect_to gyrt_coverage_url(@gyrt_coverage), notice: "Gyrt coverage was successfully created." }
        format.json { render :show, status: :created, location: @gyrt_coverage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gyrt_coverage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gyrt_coverages/1 or /gyrt_coverages/1.json
  def update
    respond_to do |format|
      if @gyrt_coverage.update(gyrt_coverage_params)
        format.html { redirect_to gyrt_coverage_url(@gyrt_coverage), notice: "Gyrt coverage was successfully updated." }
        format.json { render :show, status: :ok, location: @gyrt_coverage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gyrt_coverage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gyrt_coverages/1 or /gyrt_coverages/1.json
  def destroy
    @gyrt_coverage.destroy

    respond_to do |format|
      format.html { redirect_to gyrt_coverages_url, notice: "Gyrt coverage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gyrt_coverage
      @gyrt_coverage = GyrtCoverage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gyrt_coverage_params
      params.require(:gyrt_coverage).permit(:gyrt_batch_id, :member_id, :age, :gross_prem, :status)
    end
end
