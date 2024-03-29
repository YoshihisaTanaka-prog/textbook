class MainsController < ApplicationController
  before_action :set_main, only: %i[ show edit update destroy ]
  before_action :confirm_teacher

  # GET /mains or /mains.json
  def index
    mains = Main.all
    @mains = []
    mains.each do |m|
      @mains.push(m) if m.selection_id <= 0
    end
    session[:selection_id] = ""
  end

  # GET /mains/1 or /mains/1.json
  def show
    @main.selections.new
  end

  # GET /mains/new
  def new
    @main = Main.new
    @main.selections.new
  end

  # GET /mains/1/edit
  def edit
    @main.selections.new
  end

  # POST /mains or /mains.json
  def create
    @main = Main.new(main_params)

    respond_to do |format|
      if @main.save
        format.html { redirect_to main_url(@main), notice: "Main was successfully created." }
        format.json { render :show, status: :created, location: @main }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @main.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mains/1 or /mains/1.json
  def update
    respond_to do |format|
      if @main.update(main_params)
        format.html { redirect_to main_url(@main), notice: "Main was successfully updated." }
        format.json { render :show, status: :ok, location: @main }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @main.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mains/1 or /mains/1.json
  def destroy
    @main.destroy

    respond_to do |format|
      format.html { redirect_to mains_url, notice: "Main was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main
      @main = Main.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_params
      params.require(:main).permit(:subject_id, :question, :selection_id, selections_attributes: [:text, :kana, :id])
    end
end
