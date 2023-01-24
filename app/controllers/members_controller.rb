class MembersController < ApplicationController
  before_action :set_member, only: %i[ show edit update destroy ]

  # GET /members or /members.json
  def index
    @members = Member.all
  end

  # GET /members/1 or /members/1.json
  def show
  end

  def batch_form
    # raise 'errors'
    @moa = GyrtAgreement.find(params[:moa])
    @cooperative = Cooperative.find(params[:coop])
  end

  def batch_import
    # raise "errors"
    @moa = GyrtAgreement.find(params[:moa])
    @cooperative = Cooperative.find(params[:coop_id]).id

    @member_import = Member.import_members(params[:file], @cooperative)
    respond_to do |format|
      if @member_import
        format.html { redirect_back fallback_location: gyrt_agreement_path(@moa) , notice: "Members imported successfully." }
      else
        format.html { render :batch_import, status: :unprocessable_entity }
        format.json { render json: @member_import.errors, status: :unprocessable_entity }
        format.turbo_stream { render :batch_import, status: :unprocessable_entity }

      end

    end
  end

  # GET /members/new
  def new
    @member = Member.new
    @cooperative_members = @member.cooperative_members.build
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members or /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to member_url(@member), notice: "Member was successfully created." }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1 or /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to member_url(@member), notice: "Member was successfully updated." }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1 or /members/1.json
  def destroy
    @member.destroy

    respond_to do |format|
      format.html { redirect_to members_url, notice: "Member was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.require(:member).permit(:last_name, :first_name, :middle_name, :birth_date, :gender, cooperative_members_attributes: [ :cooperative_ids, :membership_date ])
    end
end
