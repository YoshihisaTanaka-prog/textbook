require "test_helper"

class TopsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get tops_top_url
    assert_response :success
  end

  test "should get non_auth" do
    get tops_non_auth_url
    assert_response :success
  end
end
