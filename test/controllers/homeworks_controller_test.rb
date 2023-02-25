require "test_helper"

class HomeworksControllerTest < ActionDispatch::IntegrationTest
  test "should get square_calculation" do
    get homeworks_square_calculation_url
    assert_response :success
  end

  test "should get factorization" do
    get homeworks_factorization_url
    assert_response :success
  end
end
