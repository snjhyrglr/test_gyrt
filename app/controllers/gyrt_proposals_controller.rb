class GyrtProposalsController < ApplicationController
  before_action :set_gyrt_proposal, only: %i[ show edit update destroy update_actuarial_status update_underwriting_status update_claims_status update_agent_coop_status pdf to_pdf ]

  def compute_age
    # raise 'errors'
    GyrtProposal.get_ages_for_computation(params[:file])
    # redirect_back fallback_location: gyrt_proposals_path
    @gyrt_proposal = GyrtProposal.new(ave_age: 10)
  end

  # GET /gyrt_proposals or /gyrt_proposals.json
  def index

    case current_user.class.name
    when "Agent"
      @gyrt_proposals = GyrtProposal.all
    when "Employee"
      if current_user.id == 9 # URD Head
        @gyrt_proposals = GyrtProposal.where(actuarial_approval_status: true)
      elsif current_user.id == 51 # admin
        @gyrt_proposals = GyrtProposal.all
      elsif current_user.id == 6 # Actuarial
        @gyrt_proposals = GyrtProposal.order(actuarial_approval_status: :asc).all
      end
    end

    # if current_user.class.name == "Agent"
    #   @gyrt_proposals = GyrtProposal.all
    #   elsif current_user.class.name == "Employee"
    #     if current_user.id == 9
    #       @gyrt_proposals = GyrtProposal.where(actuarial_approval_status: true)
    #     elsif current_user.id == 51
    #       @gyrt_proposals = GyrtProposal.all
    #     end
    # end
    # @gyrt_proposals = GyrtProposal.all
  end

  def pdf
    pdf = Prawn::Document.new
    pdf.text @gyrt_proposal.incharge_name, style: :bold

    send_data(pdf.render,
            filename: "#{@gyrt_proposal.cooperative.name}-proposal.pdf",
            type: 'application/pdf',
            disposition: 'inline')
  end

  def to_pdf
    @gyrt_rates = GyrtRate.left_outer_joins(:gyrt_rate_tables).where(age: 18..65, benefit_id: 1).order("gyrt_rates.age")
    @claim_requirements = @gyrt_proposal.claim_requirements
    @urd_requirements = @gyrt_proposal.urd_requirements
    
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name", template: "gyrt_proposals/proposal_pdf", formats: [:html], encoding: 'utf8'   # Excluding ".pdf" extension.
      end
    end
  end

  # GET /gyrt_proposals/1 or /gyrt_proposals/1.json
  def show
    # @gyrt_rates = GyrtRateTable.joins(:gyrt_rate).where(gyrt_proposal_id: @gyrt_proposal.id).order("gyrt_rates.age")
    
    @gyrt_rates = GyrtRate.left_outer_joins(:gyrt_rate_tables).where(age: 18..65, benefit_id: 1).order("gyrt_rates.age")
    
    # @claim_requirements = ProposalRequirement.includes(:requirement).where(claim_requirements: {claim_requirements: 1}, proposal: @gyrt_proposal)
    @claim_requirements = @gyrt_proposal.claim_requirements
    @urd_requirements = @gyrt_proposal.urd_requirements
    # @claim_requirements = ProposalRequirement.where(proposal: @gyrt_proposal)
  end

  # GET /gyrt_proposals/new
  def new
    
    if Rails.env.development?
      @gyrt_proposal = GyrtProposal.new(incharge_name: FFaker::Name.unique.name, inchage_position: FFaker::Company.unique.position)
    else 
      @gyrt_proposal = GyrtProposal.new
    end
    # @gyrt_option_benefits = @gyrt_proposal.gyrt_options.build.gyrt_option_benefits.build
  end

  # GET /gyrt_proposals/1/edit
  def edit
  end

  # POST /gyrt_proposals or /gyrt_proposals.json
  def create
    # raise 'errors'
    @gyrt_proposal = GyrtProposal.new(gyrt_proposal_params)

    respond_to do |format|
      if @gyrt_proposal.save
        
        @gyrt_proposal.convert_service_fee
        @gyrt_proposal.get_gyrt_table(params[:gyrt_proposal][:file])
        @gyrt_proposal.get_ages_for_computation(params[:gyrt_proposal][:file])
        @gyrt_proposal.compute_total_prem
        @gyrt_proposal.save_claims_requirements
        @gyrt_proposal.save_urd_requirements
        @gyrt_proposal.set_validity
        
        format.html { redirect_to gyrt_proposal_url(@gyrt_proposal), notice: "Gyrt proposal was successfully created." }
        format.json { render :show, status: :created, location: @gyrt_proposal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gyrt_proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gyrt_proposals/1 or /gyrt_proposals/1.json
  def update

    @gyrt_proposal.convert_service_fee
    @gyrt_proposal.get_gyrt_table(params[:gyrt_proposal][:file])
    @gyrt_proposal.get_ages_for_computation(params[:gyrt_proposal][:file])
    @gyrt_proposal.compute_total_prem

    respond_to do |format|
      if @gyrt_proposal.update(gyrt_proposal_params)
        format.html { redirect_to gyrt_proposal_url(@gyrt_proposal), notice: "Gyrt proposal was successfully updated." }
        format.json { render :show, status: :ok, location: @gyrt_proposal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gyrt_proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_actuarial_status
    respond_to do |format|
      if @gyrt_proposal.update_attribute(:actuarial_approval_status, 1)
      format.html { redirect_to gyrt_proposal_url(@gyrt_proposal), notice: "Actuarial Status Updated." }
      end
    end
  end

  def update_underwriting_status
    respond_to do |format|
      if @gyrt_proposal.update_attribute(:underwriting_approval_status, 1)
      format.html { redirect_to gyrt_proposal_url(@gyrt_proposal), notice: "Underwriting Status Updated." }
      end
    end
  end

  def update_claims_status
    respond_to do |format|
      if @gyrt_proposal.update_attribute(:claims_approval_status, 1)
      format.html { redirect_to gyrt_proposal_url(@gyrt_proposal), notice: "Claims Status Updated." }
      end
    end
  end

  def update_agent_coop_status
    respond_to do |format|
      if @gyrt_proposal.underwriting_approval_status == true && @gyrt_proposal.claims_approval_status == true && @gyrt_proposal.actuarial_approval_status == true
        if @gyrt_proposal.update_attribute(:agent_coop_approval_status, 1)
          format.html { redirect_to gyrt_proposal_url(@gyrt_proposal), notice: "Agent/Coop Status Updated." }
        end
      else
        format.html { redirect_to gyrt_proposal_url(@gyrt_proposal), alert: "Other should approve first!" }
      end
    end
  end

  # DELETE /gyrt_proposals/1 or /gyrt_proposals/1.json
  def destroy
    @gyrt_proposal.destroy

    respond_to do |format|
      format.html { redirect_to gyrt_proposals_url, notice: "Gyrt proposal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gyrt_proposal
      @gyrt_proposal = GyrtProposal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gyrt_proposal_params
      params.require(:gyrt_proposal
      ).permit(:cooperative_id, :incharge_name, :inchage_position, :new_min_age, :new_max_age, :old_min_age, :old_max_age, :ave_age, :members_count, :file, :coop_sf, :agent_sf, :status, :type_of_business, :policy_anniversary, :validity, :is_valid,
        gyrt_proposal_benefits_attributes: [
          :id, :gyrt_proposal_id, :benefit_id, :sum_insured, :base_prem, :_destroy
        ]
      )
    end
end
