require "test_helper"

class SortUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sort_unit = sort_units(:one)
  end

  test "should get index" do
    get sort_units_url
    assert_response :success
  end

  test "should get new" do
    get new_sort_unit_url
    assert_response :success
  end

  test "should create sort_unit" do
    assert_difference("SortUnit.count") do
      post sort_units_url, params: { sort_unit: { title: @sort_unit.title } }
    end

    assert_redirected_to sort_unit_url(SortUnit.last)
  end

  test "should show sort_unit" do
    get sort_unit_url(@sort_unit)
    assert_response :success
  end

  test "should get edit" do
    get edit_sort_unit_url(@sort_unit)
    assert_response :success
  end

  test "should update sort_unit" do
    patch sort_unit_url(@sort_unit), params: { sort_unit: { title: @sort_unit.title } }
    assert_redirected_to sort_unit_url(@sort_unit)
  end

  test "should destroy sort_unit" do
    assert_difference("SortUnit.count", -1) do
      delete sort_unit_url(@sort_unit)
    end

    assert_redirected_to sort_units_url
  end
end
