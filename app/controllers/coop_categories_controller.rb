class CoopCategoriesController < ApplicationController
  before_action :set_coop_category, only: %i[ show edit update destroy ]

  # GET /coop_categories or /coop_categories.json
  def index
    @coop_categories = CoopCategory.all
  end

  # GET /coop_categories/1 or /coop_categories/1.json
  def show
  end

  # GET /coop_categories/new
  def new
    @coop_category = CoopCategory.new
  end

  # GET /coop_categories/1/edit
  def edit
  end

  # POST /coop_categories or /coop_categories.json
  def create
    @coop_category = CoopCategory.new(coop_category_params)

    respond_to do |format|
      if @coop_category.save
        format.html { redirect_to coop_category_url(@coop_category), notice: "Coop category was successfully created." }
        format.json { render :show, status: :created, location: @coop_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coop_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coop_categories/1 or /coop_categories/1.json
  def update
    respond_to do |format|
      if @coop_category.update(coop_category_params)
        format.html { redirect_to coop_category_url(@coop_category), notice: "Coop category was successfully updated." }
        format.json { render :show, status: :ok, location: @coop_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coop_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coop_categories/1 or /coop_categories/1.json
  def destroy
    @coop_category.destroy

    respond_to do |format|
      format.html { redirect_to coop_categories_url, notice: "Coop category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coop_category
      @coop_category = CoopCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coop_category_params
      params.require(:coop_category).permit(:name)
    end
end
