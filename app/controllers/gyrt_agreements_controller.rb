class GyrtAgreementsController < ApplicationController
before_action :set_gyrt_agreement, only: %i[ show edit update destroy to_pdf update_agent_coop moa_attachments upload_coop_logo upload_ids upload_signed_moa upload_notarized_moa ]

  # GET /gyrt_agreements or /gyrt_agreements.json
  def index
    @gyrt_agreements = GyrtAgreement.all
  end

  # GET /gyrt_agreements/1 or /gyrt_agreements/1.json
  def show
  end

  def to_pdf
    respond_to do |format|
      format.pdf do
        render pdf: "GYRT MOA - #{@gyrt_agreement.cooperative}", 
        template: "gyrt_agreements/_moa_wordings", 
        formats: [:html], 
        encoding: "utf8", 
        page_size: "Legal"
        # show_as_html: true  # Excluding ".pdf" extension.
      end
    end
  end

  def notarized_moa

  end

  def moa_attachments
    # raise 'errors'
    @title = params[:title]

    @f = case params[:f]
    when "logo" then "form_coop_logo"
    when "id" then "form_ids"
    when "signed_moa" then "form_signed_moa"
    when "notarized_moa" then "form_notarized_moa"
    when "masterlist" then "form_masterlist"
    end
    
  end
  
  def upload_notarized_moa
    # raise 'errors'
    respond_to do |format|
      if @gyrt_agreement.notarized_moa.attach(params[:gyrt_agreement][:notarized_moa])
        @gyrt_agreement.update_attribute(:notarized, true)
        format.html { redirect_to gyrt_agreement_url(@gyrt_agreement), notice: "Notarized M.O.A. Uploaded Successfully!" }
      else
        @f = "form_notarized_moa"
        format.html { render 'moa_attachments', status: :unprocessable_entity }
        format.turbo_stream { render 'form_update', status: :unprocessable_entity }  
      end
    end
  end
  

  def upload_coop_logo
    respond_to do |format|
      if @gyrt_agreement.coop_logo.attach(params[:gyrt_agreement][:coop_logo])
        format.html { redirect_to gyrt_agreement_url(@gyrt_agreement), notice: "Logo Uploaded Successfully!" }
      else
        # render :moa_attachments, params[:f] = "logo"
        # redirect_to moa_attachments_gyrt_agreement_path(f: "logo"), alert: "Logo not uploaded."
        @f = "form_coop_logo"
        format.html { render 'moa_attachments', status: :unprocessable_entity }
        format.turbo_stream { render 'form_update', status: :unprocessable_entity }  
      end

    end

  end

  def upload_signed_moa
    respond_to do |format|
      if @gyrt_agreement.signed_moa.attach(params[:gyrt_agreement][:signed_moa])
        @gyrt_agreement.update_attribute(:signed_by_coop, true)
        format.html { redirect_to gyrt_agreement_url(@gyrt_agreement), notice: "Signed MOA Uploaded Successfully!" }
      else
        # render :moa_attachments, params[:f] = "logo"
        # redirect_to moa_attachments_gyrt_agreement_path(f: "logo"), alert: "Logo not uploaded."
        @f = "form_signed_moa"
        format.html { render 'moa_attachments', status: :unprocessable_entity }
        format.turbo_stream { render 'form_update', status: :unprocessable_entity }  
      end
    end
    
  end
  

  def upload_ids
    # raise 'errors'
    # @gyrt_agreement.id_uploads.attach(params[:gyrt_agreement][:id_uploads])
    # @gyrt_agreement.signed_moa.attach(params[:gyrt_agreement][:signed_moa])
    respond_to do |format|
      if @gyrt_agreement.id_uploads.attach(params[:gyrt_agreement][:id_uploads])
        @gyrt_agreement.update_attribute(:ids_upload, true)
       format.html{ redirect_to gyrt_agreement_path(@gyrt_agreement), notice: 'IDs uploaded successfully!' } 
      else
        @f = "form_ids"
        format.html { render 'moa_attachments', status: :unprocessable_entity }
        format.turbo_stream { render 'form_update', status: :unprocessable_entity }  
      end

    end

  end
  

  def update_agent_coop
    respond_to do |format|
      if @gyrt_agreement.update_attribute(:agent_coop_status, 1)
        format.html { redirect_to gyrt_agreement_url(@gyrt_agreement), notice: "Agent/Coop Status Approved!" }
      end
      format.html { redirect_to gyrt_agreement_url(@gyrt_agreement), notice: "URD, Claims and/or VP for Life Ops should approve first." }
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
          min_enrollees_count: params[:minimum_participation],
          policy_anniv_type: params[:policy_anniv],
          type_of_business: params[:type_of_business]
        )
      end
    
  end

  # GET /gyrt_agreements/1/edit
  def edit
  end

  # POST /gyrt_agreements or /gyrt_agreements.json
  def create
    # raise "errors"
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
      params.require(:gyrt_agreement).permit(:cooperative_id, :product_name, :old_min_age, :old_max_age, :new_min_age, :new_max_age, :prem_rate, :rate_type, :coop_sf, :agent_sf, :gyrt_proposal_id, :policy_anniv_type, :min_enrollees_count, :type_of_business, :agent_coop_status, :coop_logo, :signed_moa, :notarized_moa, id_uploads: [])
    end
end
