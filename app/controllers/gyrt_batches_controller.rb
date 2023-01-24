class GyrtBatchesController < ApplicationController
  before_action :set_gyrt_batch, only: %i[ show edit update destroy ]

  # GET /gyrt_batches or /gyrt_batches.json
  def index
    @gyrt_batches = GyrtBatch.all
  end

  # GET /gyrt_batches/1 or /gyrt_batches/1.json
  def show
  end

  # GET /gyrt_batches/new
  def new
    @gyrt_batch = GyrtBatch.new
  end

  # GET /gyrt_batches/1/edit
  def edit
  end

  # POST /gyrt_batches or /gyrt_batches.json
  def create
    # raise 'errors'
    @gyrt_batch = GyrtBatch.new(gyrt_batch_params)

    respond_to do |format|
      if @gyrt_batch.save

        @gyrt_batch.create_gyrt_coverages_and_compute_premium(params[:gyrt_batch][:file])
        @gyrt_batch.compute_total_prem

        format.html { redirect_to gyrt_batch_url(@gyrt_batch), notice: "Gyrt batch was successfully created." }
        format.json { render :show, status: :created, location: @gyrt_batch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gyrt_batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gyrt_batches/1 or /gyrt_batches/1.json
  def update
    respond_to do |format|
      if @gyrt_batch.update(gyrt_batch_params)
        format.html { redirect_to gyrt_batch_url(@gyrt_batch), notice: "Gyrt batch was successfully updated." }
        format.json { render :show, status: :ok, location: @gyrt_batch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gyrt_batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gyrt_batches/1 or /gyrt_batches/1.json
  def destroy
    @gyrt_batch.destroy

    respond_to do |format|
      format.html { redirect_to gyrt_batches_url, notice: "Gyrt batch was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gyrt_batch
      @gyrt_batch = GyrtBatch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gyrt_batch_params
      params.require(:gyrt_batch).permit(:cooperative_id, :matrix_id, :batch_name, :total_gross_prem, :total_coop_sf, :total_net_prem, :members_count, :denied_count, :effective_date, :expiry_date, :terms, :file)
    end
end
