class WordsController < ApplicationController
  before_action :set_word, only: %i[ show edit update destroy ]
  before_action :confirm_session, only: %i[ show new create edit update destroy ]

  # GET /words or /words.json
  def index
    if params[:student_id]
      session[:student_id] = params[:student_id]
      redirect_to words_path
    end
    confirm_session
    @words = Word.where(student_id: session[:student_id]).order(time: :desc)
  end

  # GET /words/1 or /words/1.json
  def show
  end

  # GET /words/new
  def new
    @word = Word.new
    @student = Student.find(session[:student_id])
  end

  # GET /words/1/edit
  def edit
  end

  # POST /words or /words.json
  def create
    @word = Word.new(word_params)
    student = Student.find(session[:student_id])
    @word.student_id = student.id

    if student.current_time < @word.time
      student.current_time = @word.time
      student.save
    end

    respond_to do |format|
      if @word.save
        format.html { redirect_to words_path, notice: "Word was successfully created." }
        format.json { render :show, status: :created, location: @word }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /words/1 or /words/1.json
  def update
    if session[:student_id] == @word.student_id.to_s
      respond_to do |format|
        if @word.update(word_params)
          format.html { redirect_to words_path, notice: "Word was successfully updated." }
          format.json { render :show, status: :ok, location: @word }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @word.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to words_no_session_path
    end
  end

  # DELETE /words/1 or /words/1.json
  def destroy
    if session[:student_id] == @word.student_id
      @word.destroy

      respond_to do |format|
        format.html { redirect_to words_url, notice: "Word was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      redirect_to words_no_session_path
    end
  end

  def no_session
  end

  def test
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    def confirm_session
      if session[:student_id].blank?
        redirect_to words_no_session_path
      end
    end

    # Only allow a list of trusted parameters through.
    def word_params
      params.require(:word).permit(:word, :mean, :time)
    end
end
