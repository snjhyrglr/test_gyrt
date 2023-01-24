class CoopTypesController < ApplicationController
  before_action :set_coop_type, only: %i[ show edit update destroy ]

  # GET /coop_types or /coop_types.json
  def index
    @coop_types = CoopType.all
  end

  # GET /coop_types/1 or /coop_types/1.json
  def show
  end

  # GET /coop_types/new
  def new
    @coop_type = CoopType.new
  end

  # GET /coop_types/1/edit
  def edit
  end

  # POST /coop_types or /coop_types.json
  def create
    @coop_type = CoopType.new(coop_type_params)

    respond_to do |format|
      if @coop_type.save
        format.html { redirect_to coop_type_url(@coop_type), notice: "Coop type was successfully created." }
        format.json { render :show, status: :created, location: @coop_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coop_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coop_types/1 or /coop_types/1.json
  def update
    respond_to do |format|
      if @coop_type.update(coop_type_params)
        format.html { redirect_to coop_type_url(@coop_type), notice: "Coop type was successfully updated." }
        format.json { render :show, status: :ok, location: @coop_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coop_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coop_types/1 or /coop_types/1.json
  def destroy
    @coop_type.destroy

    respond_to do |format|
      format.html { redirect_to coop_types_url, notice: "Coop type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coop_type
      @coop_type = CoopType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coop_type_params
      params.require(:coop_type).permit(:name)
    end
end
