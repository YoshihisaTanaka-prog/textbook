class SelectionsController < ApplicationController
  before_action :set_selection, only: %i[ show edit update destroy ]
  before_action :confirm_teacher

  # GET /selections or /selections.json
  def index
    @selections = Selection.all
  end

  # GET /selections/1 or /selections/1.json
  def show
    @main = Main.new
    @ss = SolutionSelection.new
    @solution = Solution.new
  end

  # GET /selections/new
  def new
    @selection = Selection.new
  end

  # GET /selections/1/edit
  def edit
  end

  # POST /selections or /selections.json
  def create
    @selection = Selection.new(selection_params)

    respond_to do |format|
      if @selection.save
        format.html { redirect_to selection_url(@selection), notice: "Selection was successfully created." }
        format.json { render :show, status: :created, location: @selection }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @selection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /selections/1 or /selections/1.json
  def update
    respond_to do |format|
      if @selection.update(selection_params)
        format.html { redirect_to selection_url(@selection), notice: "Selection was successfully updated." }
        format.json { render :show, status: :ok, location: @selection }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @selection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selections/1 or /selections/1.json
  def destroy
    @selection.destroy
    session[:selection_id] = ""
    respond_to do |format|
      format.html { redirect_to selections_url, notice: "Selection was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selection
      @selection = Selection.find(params[:id])
      session[:selection_id] = @selection.id
    end

    # Only allow a list of trusted parameters through.
    def selection_params
      params.require(:selection).permit(:text, :main_id)
    end
end
