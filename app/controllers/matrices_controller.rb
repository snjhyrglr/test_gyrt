class MatricesController < ApplicationController
  before_action :set_matrix, only: %i[ show edit update destroy ]

  # GET /matrices or /matrices.json
  def index
    # raise 'errors'
    @matrices = Matrix.all
  end

  # GET /matrices/1 or /matrices/1.json
  def show

  end

  def update_status
      @matrix = Matrix.find(params[:matrix_id])

      respond_to do |format|
        if @matrix.update_attribute(:status, true)
        format.html { redirect_to matrix_url(@matrix), notice: "M.O.A. saved to Matrix Successfully." }
        format.json { render :show, status: :ok, location: @matrix }
        end
      end
  end

  # GET /matrices/new
  def new
    # raise 'errors'
    #TO Update Status of Proposal upon ACCEPT
    @gyrt_proposal = GyrtProposal.find(params[:gyrt_proposal_id]) if params[:gyrt_proposal_id]
    @gyrt_proposal.update_attribute(:status, true) if @gyrt_proposal

    @matrix = Matrix.new(
      cooperative_id: params[:cooperative_id], 
      product_name: params[:product_name], 
      old_min_age: params[:old_min_age], 
      old_max_age: params[:old_max_age], 
      new_min_age: params[:new_min_age], 
      new_max_age: params[:new_max_age], 
      prem_rate: params[:prem_rate], 
      rate_type: params[:rate_type], 
      coop_sf: params[:coop_sf],
      agent_sf: params[:agent_sf],
      gyrt_proposal_id: params[:gyrt_proposal_id],
      proposal_no: params[:proposal_no],
      min_enrollees_count: params[:min_enrollees],
      status: 0
    )
  end

  # GET /matrices/1/edit
  def edit
  end

  # POST /matrices or /matrices.json
  def create
    
    @matrix = Matrix.new(matrix_params)

    respond_to do |format|
      if @matrix.save
        format.html { redirect_to matrix_url(@matrix), notice: "Matrix was successfully created." }
        format.json { render :show, status: :created, location: @matrix }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @matrix.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matrices/1 or /matrices/1.json
  def update
    respond_to do |format|
      if @matrix.update(matrix_params)
        format.html { redirect_to matrix_url(@matrix), notice: "Matrix was successfully updated." }
        format.json { render :show, status: :ok, location: @matrix }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @matrix.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matrices/1 or /matrices/1.json
  def destroy
    @matrix.destroy

    respond_to do |format|
      format.html { redirect_to matrices_url, notice: "Matrix was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matrix
      @matrix = Matrix.find(params[:id])
      rescue ActiveRecord::RecordNotFound
       redirect_to gyrt_proposals_path, alert: "Proposal not yet approved."
    end

    # Only allow a list of trusted parameters through.
    def matrix_params
      params.require(:matrix).permit(:cooperative_id, :product_name, :old_min_age, :old_max_age, :new_min_age, :new_max_age, :prem_rate, :rate_type, :coop_sf, :gyrt_proposal_id, :proposal_no, :policy_anniv, :min_enrollees_count, :status, :agent_sf)
    end
end
