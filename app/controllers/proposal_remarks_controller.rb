class ProposalRemarksController < ApplicationController
  before_action :set_proposal_remark, only: %i[ show edit update destroy ]

  # GET /proposal_remarks or /proposal_remarks.json
  def index
    @proposal_remarks = ProposalRemark.all
  end

  # GET /proposal_remarks/1 or /proposal_remarks/1.json
  def show
  end

  # GET /proposal_remarks/new
  def new
    # @proposal_remark = ProposalRemark.new
    @gyrt_proposal = GyrtProposal.find(params[:gp])
    @proposal_remark = @gyrt_proposal.proposal_remarks.build
  end

  # GET /proposal_remarks/1/edit
  def edit
    
  end

  # POST /proposal_remarks or /proposal_remarks.json
  def create
    # raise 'errors'
    @proposal_remark = ProposalRemark.new(proposal_remark_params)
    @proposal_remark.gyrt_proposal_id = params[:gp]

    respond_to do |format|
      if @proposal_remark.save
        # format.html { redirect_to proposal_remark_url(@proposal_remark), notice: "Proposal remark was successfully created." }
        format.html { redirect_to gyrt_proposal_path(@proposal_remark.gyrt_proposal_id), notice: "Proposal remark was successfully created." }
        format.json { render :show, status: :created, location: @proposal_remark }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @proposal_remark.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }

      end
    end
  end

  # PATCH/PUT /proposal_remarks/1 or /proposal_remarks/1.json
  def update
    respond_to do |format|
      if @proposal_remark.update(proposal_remark_params)
        # format.html { redirect_to proposal_remark_url(@proposal_remark), notice: "Proposal remark was successfully updated." }
        format.html { redirect_to gyrt_proposal_path(@proposal_remark.gyrt_proposal_id), notice: "Proposal remark was successfully updated." }
        format.json { render :show, status: :ok, location: @proposal_remark }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @proposal_remark.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposal_remarks/1 or /proposal_remarks/1.json
  def destroy
    @proposal_remark.destroy

    respond_to do |format|
      format.html { redirect_to proposal_remarks_url, notice: "Proposal remark was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal_remark
      @proposal_remark = ProposalRemark.find(params[:id])
      @proposal_remark.nil? ? @proposal_remark : @proposal_remark = ProposalRemark.find(params[:pr_id])
    end

    # Only allow a list of trusted parameters through.
    def proposal_remark_params
      params.require(:proposal_remark).permit(:gyrt_proposal_id, :remark, :remark_type, :status)
    end
end
