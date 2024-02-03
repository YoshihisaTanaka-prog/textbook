require "test_helper"

class SortSentencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sort_sentence = sort_sentences(:one)
  end

  test "should get index" do
    get sort_sentences_url
    assert_response :success
  end

  test "should get new" do
    get new_sort_sentence_url
    assert_response :success
  end

  test "should create sort_sentence" do
    assert_difference("SortSentence.count") do
      post sort_sentences_url, params: { sort_sentence: { sentence: @sort_sentence.sentence, word1: @sort_sentence.word1, word10: @sort_sentence.word10, word11: @sort_sentence.word11, word12: @sort_sentence.word12, word13: @sort_sentence.word13, word14: @sort_sentence.word14, word15: @sort_sentence.word15, word16: @sort_sentence.word16, word17: @sort_sentence.word17, word18: @sort_sentence.word18, word19: @sort_sentence.word19, word2: @sort_sentence.word2, word20: @sort_sentence.word20, word3: @sort_sentence.word3, word4: @sort_sentence.word4, word5: @sort_sentence.word5, word6: @sort_sentence.word6, word7: @sort_sentence.word7, word8: @sort_sentence.word8, word9: @sort_sentence.word9 } }
    end

    assert_redirected_to sort_sentence_url(SortSentence.last)
  end

  test "should show sort_sentence" do
    get sort_sentence_url(@sort_sentence)
    assert_response :success
  end

  test "should get edit" do
    get edit_sort_sentence_url(@sort_sentence)
    assert_response :success
  end

  test "should update sort_sentence" do
    patch sort_sentence_url(@sort_sentence), params: { sort_sentence: { sentence: @sort_sentence.sentence, word1: @sort_sentence.word1, word10: @sort_sentence.word10, word11: @sort_sentence.word11, word12: @sort_sentence.word12, word13: @sort_sentence.word13, word14: @sort_sentence.word14, word15: @sort_sentence.word15, word16: @sort_sentence.word16, word17: @sort_sentence.word17, word18: @sort_sentence.word18, word19: @sort_sentence.word19, word2: @sort_sentence.word2, word20: @sort_sentence.word20, word3: @sort_sentence.word3, word4: @sort_sentence.word4, word5: @sort_sentence.word5, word6: @sort_sentence.word6, word7: @sort_sentence.word7, word8: @sort_sentence.word8, word9: @sort_sentence.word9 } }
    assert_redirected_to sort_sentence_url(@sort_sentence)
  end

  test "should destroy sort_sentence" do
    assert_difference("SortSentence.count", -1) do
      delete sort_sentence_url(@sort_sentence)
    end

    assert_redirected_to sort_sentences_url
  end
end
