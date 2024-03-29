class SortSentencesController < ApplicationController
  before_action :set_sort_sentence, only: %i[ show edit update destroy ]
  before_action :confirm_teacher, only: %i[ index show new edit create update destroy ]

  # GET /sort_sentences or /sort_sentences.json
  def index
    @sort_sentences = SortSentence.all
    @units1 = SortUnit.where(grade: 1)
    @units2 = SortUnit.where(grade: 2)
    @units3 = SortUnit.where(grade: 3)
  end

  # GET /sort_sentences/1 or /sort_sentences/1.json
  def show
  end

  # GET /sort_sentences/new
  def new
    @sort_sentence = SortSentence.new
    @unit = SortUnit.new
  end

  # GET /sort_sentences/1/edit
  def edit
    @unit = SortUnit.new
  end

  # POST /sort_sentences or /sort_sentences.json
  def create
    @sort_sentence = SortSentence.new(sort_sentence_params)

    respond_to do |format|
      if @sort_sentence.save
        session[:sort_unit_id] = @sort_sentence.unit_id
        format.html { redirect_to new_sort_sentence_url, notice: "Sort sentence was successfully created." }
        format.json { render :show, status: :created, location: @sort_sentence }
      else
        @unit = SortUnit.new
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sort_sentence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sort_sentences/1 or /sort_sentences/1.json
  def update
    respond_to do |format|
      if @sort_sentence.update(sort_sentence_params)
        session[:sort_unit_id] = @sort_sentence.unit_id
        format.html { redirect_to sort_sentence_url(@sort_sentence), notice: "Sort sentence was successfully updated." }
        format.json { render :show, status: :ok, location: @sort_sentence }
      else
        @unit = @sort_sentence.unit
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sort_sentence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sort_sentences/1 or /sort_sentences/1.json
  def destroy
    @sort_sentence.destroy

    respond_to do |format|
      format.html { redirect_to sort_sentences_url, notice: "Sort sentence was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    ids = []
    array = []
    params[:unit_ids].each do |unit_id|
      sss = SortSentence.where(unit_id: unit_id)
      ids.push(unit_id.to_i)
      sss.each do |ss|
        array.push(ss.hash_format)
      end
    end
    session[:selected_unit_ids] = ids
    render json: shuffle(array)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sort_sentence
      @sort_sentence = SortSentence.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sort_sentence_params
      params.require(:sort_sentence).permit(:word1, :word2, :word3, :word4, :word5, :word6, :word7, :word8, :word9, :word10, :word11, :word12, :word13, :word14, :word15, :word16, :word17, :word18, :word19, :word20, :sentence, :unit_id)
    end

    def shuffle array
      new_array = array
      (0..(array.length - 1)).each do |i|
        r = rand(array.length)
        keep = new_array[i]
        new_array[i] = new_array[r]
        new_array[r] = keep
      end
      if array.length > 15
        ret = []
        (0..14).each do |i|
          ret.push(new_array[i])
        end
        return ret
      else
        return new_array
      end
    end
end
