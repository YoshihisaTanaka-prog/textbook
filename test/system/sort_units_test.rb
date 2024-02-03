require "application_system_test_case"

class SortUnitsTest < ApplicationSystemTestCase
  setup do
    @sort_unit = sort_units(:one)
  end

  test "visiting the index" do
    visit sort_units_url
    assert_selector "h1", text: "Sort units"
  end

  test "should create sort unit" do
    visit sort_units_url
    click_on "New sort unit"

    fill_in "Title", with: @sort_unit.title
    click_on "Create Sort unit"

    assert_text "Sort unit was successfully created"
    click_on "Back"
  end

  test "should update Sort unit" do
    visit sort_unit_url(@sort_unit)
    click_on "Edit this sort unit", match: :first

    fill_in "Title", with: @sort_unit.title
    click_on "Update Sort unit"

    assert_text "Sort unit was successfully updated"
    click_on "Back"
  end

  test "should destroy Sort unit" do
    visit sort_unit_url(@sort_unit)
    click_on "Destroy this sort unit", match: :first

    assert_text "Sort unit was successfully destroyed"
  end
end
