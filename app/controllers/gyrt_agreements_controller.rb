class GyrtAgreementsController < ApplicationController
  before_action :set_gyrt_agreement, only: %i[ show edit update destroy to_pdf update_und update_vp update_agent_coop update_claims ]

  # GET /gyrt_agreements or /gyrt_agreements.json
  def index
    @gyrt_agreements = GyrtAgreement.all
  end

  # GET /gyrt_agreements/1 or /gyrt_agreements/1.json
  def show
  end

  def to_pdf
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name", template: "gyrt_agreements/_moa_wordings", formats: [:html], encoding: "utf8"   # Excluding ".pdf" extension.
      end
    end
  end

  def update_vp
    respond_to do |format|
      if @gyrt_agreement.underwriting_status == true && @gyrt_agreement.claims_status == true
        if @gyrt_agreement.update_attribute(:vp_status, 1)
          format.html { redirect_to gyrt_agreement_url(@gyrt_agreement), notice: "VP for Operations Status Approved!" }
        end
      else
        format.html { redirect_to gyrt_agreement_url(@gyrt_agreement), alert: "URD and/or Claims dept should approve first." }
      end
    end
  end

  def update_claims
    respond_to do |format|
      if @gyrt_agreement.update_attribute(:claims_status, 1)
        format.html { redirect_to gyrt_agreement_url(@gyrt_agreement), notice: "Claims Status Approved!" }
      end
    end
  end

  def update_agent_coop
    respond_to do |format|
      if @gyrt_agreement.underwriting_status == true && @gyrt_agreement.claims_status == true && @gyrt_agreement.vp_status == true

        if @gyrt_agreement.update_attribute(:agent_coop_status, 1)
          format.html { redirect_to gyrt_agreement_url(@gyrt_agreement), notice: "Agent/Coop Status Approved!" }
        end
      else
        format.html { redirect_to gyrt_agreement_url(@gyrt_agreement), notice: "URD, Claims and/or VP for Life Ops should approve first." }
      end
    end
  end

  def update_und
    respond_to do |format|
      if @gyrt_agreement.update_attribute(:underwriting_status, 1)
        format.html { redirect_to gyrt_agreement_url(@gyrt_agreement), notice: "Underwriting Status Approved!" }
      end
    end
  end

  # GET /gyrt_agreements/new
  def new
    
    @check = GyrtAgreement.find_by(gyrt_proposal_id: params[:gyrt_proposal_id])
    
      unless @check.nil?
        redirect_back fallback_location: gyrt_proposal_path(params[:gyrt_proposal_id]), alert: "Proposal already."
      else
        @gyrt_agreement = GyrtAgreement.new(
          cooperative_id: params[:cooperative_id],
          gyrt_proposal_id: params[:gyrt_proposal_id],
          product_name: params[:product_name],
          old_min_age: params[:old_min_age],
          old_max_age: params[:old_max_age],
          new_min_age: params[:new_min_age],
          new_max_age: params[:new_max_age],
          prem_rate: params[:prem_rate], 
          rate_type: params[:rate_type], 
          coop_sf: params[:coop_sf],
          agent_sf: params[:agent_sf],
          min_enrollees_count: params[:minimum_participation]
        )
      end
    
  end

  # GET /gyrt_agreements/1/edit
  def edit
  end

  # POST /gyrt_agreements or /gyrt_agreements.json
  def create
    @gyrt_agreement = GyrtAgreement.new(gyrt_agreement_params)

    respond_to do |format|
      if @gyrt_agreement.save
        @gyrt_agreement.set_approval_status

        format.html { redirect_to gyrt_agreement_url(@gyrt_agreement), notice: "M.O.A was successfully created." }
        format.json { render :show, status: :created, location: @gyrt_agreement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gyrt_agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gyrt_agreements/1 or /gyrt_agreements/1.json
  def update
    respond_to do |format|
      if @gyrt_agreement.update(gyrt_agreement_params)
        format.html { redirect_to gyrt_agreement_url(@gyrt_agreement), notice: "M.O.A was successfully updated." }
        format.json { render :show, status: :ok, location: @gyrt_agreement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gyrt_agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gyrt_agreements/1 or /gyrt_agreements/1.json
  def destroy
    @gyrt_agreement.destroy

    respond_to do |format|
      format.html { redirect_to gyrt_agreements_url, notice: "M.O.A was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gyrt_agreement
      @gyrt_agreement = GyrtAgreement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gyrt_agreement_params
      params.require(:gyrt_agreement).permit(:cooperative_id, :product_name, :old_min_age, :old_max_age, :new_min_age, :new_max_age, :prem_rate, :rate_type, :coop_sf, :agent_sf, :gyrt_proposal_id, :policy_anniv_type, :min_enrollees_count, :underwriting_status, :claims_status, :vp_status, :agent_coop_status)
    end
end
