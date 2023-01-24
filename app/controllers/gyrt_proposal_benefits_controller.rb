class GyrtProposalBenefitsController < ApplicationController
  before_action :set_gyrt_proposal_benefit, only: %i[ show edit update destroy ]

  # GET /gyrt_proposal_benefits or /gyrt_proposal_benefits.json
  def index
    @gyrt_proposal_benefits = GyrtProposalBenefit.all
    @gyrt_proposals = GyrtProposal.all
  end

  # GET /gyrt_proposal_benefits/1 or /gyrt_proposal_benefits/1.json
  def show
  end

  # GET /gyrt_proposal_benefits/new
  def new
    @gyrt_proposal_benefit = GyrtProposalBenefit.new
  end

  # GET /gyrt_proposal_benefits/1/edit
  def edit
  end

  # POST /gyrt_proposal_benefits or /gyrt_proposal_benefits.json
  def create
    @gyrt_proposal_benefit = GyrtProposalBenefit.new(gyrt_proposal_benefit_params)

    respond_to do |format|
      if @gyrt_proposal_benefit.save
        format.html { redirect_to gyrt_proposal_benefit_url(@gyrt_proposal_benefit), notice: "Gyrt proposal benefit was successfully created." }
        format.json { render :show, status: :created, location: @gyrt_proposal_benefit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gyrt_proposal_benefit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gyrt_proposal_benefits/1 or /gyrt_proposal_benefits/1.json
  def update
    respond_to do |format|
      if @gyrt_proposal_benefit.update(gyrt_proposal_benefit_params)
        format.html { redirect_to gyrt_proposal_benefit_url(@gyrt_proposal_benefit), notice: "Gyrt proposal benefit was successfully updated." }
        format.json { render :show, status: :ok, location: @gyrt_proposal_benefit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gyrt_proposal_benefit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gyrt_proposal_benefits/1 or /gyrt_proposal_benefits/1.json
  def destroy
    @gyrt_proposal_benefit.destroy

    respond_to do |format|
      format.html { redirect_to gyrt_proposal_benefits_url, notice: "Gyrt proposal benefit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gyrt_proposal_benefit
      @gyrt_proposal_benefit = GyrtProposalBenefit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gyrt_proposal_benefit_params
      params.require(:gyrt_proposal_benefit).permit(:gyrt_proposal_id, :benefit_id, :sum_insured, :base_prem)
    end
end
