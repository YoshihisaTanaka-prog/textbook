class SortUnitsController < ApplicationController
  before_action :set_sort_unit, only: %i[ show edit update destroy ]
  before_action :confirm_teacher

  # GET /sort_units or /sort_units.json
  def index
    @sort_units = SortUnit.all
  end

  # GET /sort_units/1 or /sort_units/1.json
  def show
  end

  # GET /sort_units/new
  def new
    @sort_unit = SortUnit.new
  end

  # GET /sort_units/1/edit
  def edit
  end

  # POST /sort_units or /sort_units.json
  def create
    @sort_unit = SortUnit.new(sort_unit_params)
    session[:grade_num] = @sort_unit.grade

    respond_to do |format|
      if @sort_unit.save
        session[:sort_unit_id] = @sort_unit.id
        format.html { redirect_to new_sort_sentence_url, notice: "Sort unit was successfully created." }
        format.json { render :show, status: :created, location: @sort_unit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sort_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sort_units/1 or /sort_units/1.json
  def update
    respond_to do |format|
      if @sort_unit.update(sort_unit_params)
        session[:grade_num] = @sort_unit.grade
        format.html { redirect_to sort_unit_url(@sort_unit), notice: "Sort unit was successfully updated." }
        format.json { render :show, status: :ok, location: @sort_unit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sort_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sort_units/1 or /sort_units/1.json
  def destroy
    @sort_unit.destroy

    respond_to do |format|
      format.html { redirect_to sort_units_url, notice: "Sort unit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sort_unit
      @sort_unit = SortUnit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sort_unit_params
      params.require(:sort_unit).permit(:title, :grade)
    end
end
