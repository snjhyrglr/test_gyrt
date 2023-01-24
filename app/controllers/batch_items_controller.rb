class BatchItemsController < ApplicationController
  before_action :set_batch_item, only: %i[ show edit update destroy approve_item deny_item ]

  # GET /batch_items or /batch_items.json
  def index
    @batch_items = BatchItem.all
  end

  # GET /batch_items/1 or /batch_items/1.json
  def show
  end

  def approve_item
    batch = params[:batch_id]
    if @batch_item.update_attribute(:status, 'APPROVED')
      redirect_to batch_path(batch), notice: "#{@batch_item} have been approved."
    end
  end

  def deny_item
    batch = params[:batch_id]
    if @batch_item.update_attribute(:status, 'DENIED')
      redirect_to batch_path(batch), alert: "#{@batch_item} have been denied."
    end
  end

  def approve_all
    puts "***#{params[:batch_id]}***"
    @batch = BatchItem.where(batch_id: params[:batch_id])
      if @batch.update_all(status: "APPROVED")
        redirect_to batch_path(params[:batch_id]), notice: "All batch items have been approved!"
      end
  end

  def deny_all
    @batch = BatchItem.where(batch_id: params[:batch_id])
      if @batch.update_all(status: "DENIED")
        redirect_to batch_path(params[:batch_id]), alert: "All batch items have been denied!"
      end
  end

  # GET /batch_items/new
  def new
    @batch_item = BatchItem.new
  end

  # GET /batch_items/1/edit
  def edit
  end

  # POST /batch_items or /batch_items.json
  def create
    @batch_item = BatchItem.new(batch_item_params)

    respond_to do |format|
      if @batch_item.save
        format.html { redirect_to batch_item_url(@batch_item), notice: "Batch item was successfully created." }
        format.json { render :show, status: :created, location: @batch_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @batch_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batch_items/1 or /batch_items/1.json
  def update
    respond_to do |format|
      if @batch_item.update(batch_item_params)
        format.html { redirect_to batch_item_url(@batch_item), notice: "Batch item was successfully updated." }
        format.json { render :show, status: :ok, location: @batch_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @batch_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batch_items/1 or /batch_items/1.json
  def destroy
    @batch_item.destroy

    respond_to do |format|
      format.html { redirect_to batch_items_url, notice: "Batch item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch_item
      @batch_item = BatchItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def batch_item_params
      params.require(:batch_item).permit(:batch_id, :cooperative_id, :member_id, :age, :sum_insured, :effective_date, :expiry_date, :terms, :gross_prem, :coop_sf, :net_prem)
    end
end
