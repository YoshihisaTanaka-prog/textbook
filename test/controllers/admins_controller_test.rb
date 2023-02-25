require "test_helper"

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get teacher" do
    get admins_teacher_url
    assert_response :success
  end

  test "should get database" do
    get admins_database_url
    assert_response :success
  end
end
