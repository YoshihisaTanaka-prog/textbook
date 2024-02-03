require "application_system_test_case"

class SortSentencesTest < ApplicationSystemTestCase
  setup do
    @sort_sentence = sort_sentences(:one)
  end

  test "visiting the index" do
    visit sort_sentences_url
    assert_selector "h1", text: "Sort sentences"
  end

  test "should create sort sentence" do
    visit sort_sentences_url
    click_on "New sort sentence"

    fill_in "Sentence", with: @sort_sentence.sentence
    fill_in "Word1", with: @sort_sentence.word1
    fill_in "Word10", with: @sort_sentence.word10
    fill_in "Word11", with: @sort_sentence.word11
    fill_in "Word12", with: @sort_sentence.word12
    fill_in "Word13", with: @sort_sentence.word13
    fill_in "Word14", with: @sort_sentence.word14
    fill_in "Word15", with: @sort_sentence.word15
    fill_in "Word16", with: @sort_sentence.word16
    fill_in "Word17", with: @sort_sentence.word17
    fill_in "Word18", with: @sort_sentence.word18
    fill_in "Word19", with: @sort_sentence.word19
    fill_in "Word2", with: @sort_sentence.word2
    fill_in "Word20", with: @sort_sentence.word20
    fill_in "Word3", with: @sort_sentence.word3
    fill_in "Word4", with: @sort_sentence.word4
    fill_in "Word5", with: @sort_sentence.word5
    fill_in "Word6", with: @sort_sentence.word6
    fill_in "Word7", with: @sort_sentence.word7
    fill_in "Word8", with: @sort_sentence.word8
    fill_in "Word9", with: @sort_sentence.word9
    click_on "Create Sort sentence"

    assert_text "Sort sentence was successfully created"
    click_on "Back"
  end

  test "should update Sort sentence" do
    visit sort_sentence_url(@sort_sentence)
    click_on "Edit this sort sentence", match: :first

    fill_in "Sentence", with: @sort_sentence.sentence
    fill_in "Word1", with: @sort_sentence.word1
    fill_in "Word10", with: @sort_sentence.word10
    fill_in "Word11", with: @sort_sentence.word11
    fill_in "Word12", with: @sort_sentence.word12
    fill_in "Word13", with: @sort_sentence.word13
    fill_in "Word14", with: @sort_sentence.word14
    fill_in "Word15", with: @sort_sentence.word15
    fill_in "Word16", with: @sort_sentence.word16
    fill_in "Word17", with: @sort_sentence.word17
    fill_in "Word18", with: @sort_sentence.word18
    fill_in "Word19", with: @sort_sentence.word19
    fill_in "Word2", with: @sort_sentence.word2
    fill_in "Word20", with: @sort_sentence.word20
    fill_in "Word3", with: @sort_sentence.word3
    fill_in "Word4", with: @sort_sentence.word4
    fill_in "Word5", with: @sort_sentence.word5
    fill_in "Word6", with: @sort_sentence.word6
    fill_in "Word7", with: @sort_sentence.word7
    fill_in "Word8", with: @sort_sentence.word8
    fill_in "Word9", with: @sort_sentence.word9
    click_on "Update Sort sentence"

    assert_text "Sort sentence was successfully updated"
    click_on "Back"
  end

  test "should destroy Sort sentence" do
    visit sort_sentence_url(@sort_sentence)
    click_on "Destroy this sort sentence", match: :first

    assert_text "Sort sentence was successfully destroyed"
  end
end
