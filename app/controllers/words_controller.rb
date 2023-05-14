class WordsController < ApplicationController
  before_action :set_word, only: %i[ show edit update destroy mistake ]
  before_action :confirm_session, only: %i[ show new create edit update destroy test ]

  require 'net/http'
  require "lemmatizer"

  # GET /words or /words.json
  def index
    if params[:student_id]
      session[:student_id] = params[:student_id]
      redirect_to words_path
    end
    confirm_session
    @words = Word.where(student_id: session[:student_id]).order(time: :desc).order(:word)
    @student = Student.find(session[:student_id])
  end

  # GET /words/1 or /words/1.json
  def show
  end

  # GET /words/new
  def new
    @word = Word.new
    @student = Student.find(session[:student_id])
    @current_time_words = Word.where(student_id: @student.id, time: @student.current_time).order(:word)
  end

  # GET /words/1/edit
  def edit
  end

  # POST /words or /words.json
  def create
    @word = Word.new(word_params)
    student = Student.find(session[:student_id])
    @word.student_id = student.id
    @word.mistake_num = 0

    if student.current_time < @word.time
      student.current_time = @word.time
      student.save
    end

    respond_to do |format|
      if @word.save
        format.html { redirect_to new_word_path, notice: "Word was successfully created." }
        format.json { render :show, status: :created, location: @word }
      else
        format.html { 
          @student = student
          @current_time_words = Word.where(student_id: @student.id, time: @student.current_time).order(:word)
          render :new, status: :unprocessable_entity
        }
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
    if session[:student_id] == @word.student_id.to_s
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
    student = Student.find(session[:student_id])
    @words_array = []
    for i in 1..student.current_time do
      words = Word.where(student_id: student.id, time: i)
      words.each do |w|
        r = rand( pow_2(student.current_time - i) )
        if r <= w.mistake_num
          @words_array << w
        end
      end
    end
    @ask_array = []
    for i in 1..@words_array.length do
      r = rand(@words_array.length)
      keep = @words_array[i - 1]
      @words_array[i - 1] = @words_array[r]
      @words_array[r] = keep
      r = rand(2)
      @ask_array.push(r)
    end
  end

  def mistake
    @word.mistake_num = @word.mistake_num + 1
    @word.save
    respond_to do |format|
      format.html {
        redirect_to words_path
      }
      format.json { render json: @word}
    end
  end

  def to_prototype
    lem = Lemmatizer.new()
    line = ""
    params[:words].each_with_index do |word, index|
      if index == 0
        line = lem.lemma(word)
      else
        line = line + " " + lem.lemma(word)
      end
    end
    render plain: line
  end

  def translate
    logger.debug params
    url = URI.parse("https://translation.googleapis.com/language/translate/v2")
    prm = {
      q: params[:word],
      source: params[:from],
      target: params[:to],
      key: ENV['G_API_TOKEN']
    }
    url.query = URI.encode_www_form(prm)
    res = Net::HTTP.get_response(url)
    render plain: JSON.parse(res.body)['data']['translations'][0]['translatedText']
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

    def pow_2 num
      if num > 5 && num % 5 == 0
        return 100
      end
      ret = 1
      for i in 1..num do
        ret = ret * 2
      end
      return ret
    end
end
