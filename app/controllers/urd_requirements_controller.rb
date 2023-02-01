class UrdRequirementsController < ApplicationController
  before_action :set_urd_requirement, only: %i[ show edit update destroy ]

  # GET /urd_requirements or /urd_requirements.json
  def index
    @urd_requirements = UrdRequirement.all
  end

  # GET /urd_requirements/1 or /urd_requirements/1.json
  def show
  end

  # GET /urd_requirements/new
  def new
    @urd_requirement = UrdRequirement.new
    @gyrt_proposal = GyrtProposal.find(params[:gyrt_proposal]) if params[:gyrt_proposal]

  end

  # GET /urd_requirements/1/edit
  def edit
  end

  # POST /urd_requirements or /urd_requirements.json
  def create
    @urd_requirement = UrdRequirement.new(urd_requirement_params)

    respond_to do |format|
      if @urd_requirement.save
        unless params[:urd_requirement][:gyrt_proposal].nil?
          @urd_requirement.create_proposal_req(params[:urd_requirement][:gyrt_proposal])
        end
        format.html { redirect_to urd_requirement_url(@urd_requirement), notice: "Urd requirement was successfully created." }
        format.json { render :show, status: :created, location: @urd_requirement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @urd_requirement.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }

      end
    end
  end

  # PATCH/PUT /urd_requirements/1 or /urd_requirements/1.json
  def update
    respond_to do |format|
      if @urd_requirement.update(urd_requirement_params)
        format.html { redirect_to urd_requirement_url(@urd_requirement), notice: "Urd requirement was successfully updated." }
        format.json { render :show, status: :ok, location: @urd_requirement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @urd_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /urd_requirements/1 or /urd_requirements/1.json
  def destroy
    @urd_requirement.destroy

    respond_to do |format|
      format.html { redirect_to urd_requirements_url, notice: "Urd requirement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_urd_requirement
      @urd_requirement = UrdRequirement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def urd_requirement_params
      params.require(:urd_requirement).permit(:requirement, :description, :requirement_type)
    end
end
