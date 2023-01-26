class ClaimRequirementsController < ApplicationController
  before_action :set_claim_requirement, only: %i[ show edit update destroy ]

  # GET /claim_requirements or /claim_requirements.json
  def index
    @claim_requirements = ClaimRequirement.all
  end

  # GET /claim_requirements/1 or /claim_requirements/1.json
  def show
  end

  # GET /claim_requirements/new
  def new
    @claim_requirement = ClaimRequirement.new
    
    @gyrt_proposal = GyrtProposal.find(params[:gyrt_proposal]) if params[:gyrt_proposal]
  end

  # GET /claim_requirements/1/edit
  def edit
  end

  # POST /claim_requirements or /claim_requirements.json
  def create
    # raise 'errors'
    @claim_requirement = ClaimRequirement.new(claim_requirement_params)

    respond_to do |format|
      if @claim_requirement.save
        unless params[:claim_requirement][:gyrt_proposal].nil?
          @claim_requirement.create_proposal_req(params[:claim_requirement][:gyrt_proposal])
        end
        format.html { redirect_to claim_requirement_url(@claim_requirement), notice: "Claim requirement was successfully created." }
        format.json { render :show, status: :created, location: @claim_requirement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @claim_requirement.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }

      end
    end
  end

  # PATCH/PUT /claim_requirements/1 or /claim_requirements/1.json
  def update
    respond_to do |format|
      if @claim_requirement.update(claim_requirement_params)
        format.html { redirect_to claim_requirement_url(@claim_requirement), notice: "Claim requirement was successfully updated." }
        format.json { render :show, status: :ok, location: @claim_requirement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @claim_requirement.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }

      end
    end
  end

  # DELETE /claim_requirements/1 or /claim_requirements/1.json
  def destroy
    @claim_requirement.destroy

    respond_to do |format|
      format.html { redirect_to claim_requirements_url, notice: "Claim requirement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_claim_requirement
      @claim_requirement = ClaimRequirement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def claim_requirement_params
      params.require(:claim_requirement).permit(:requirement, :description, :requirement_type, :gyrt_proposal)
    end
end
