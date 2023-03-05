require "test_helper"

class OutSitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @out_site = out_sites(:one)
  end

  test "should get index" do
    get out_sites_url
    assert_response :success
  end

  test "should get new" do
    get new_out_site_url
    assert_response :success
  end

  test "should create out_site" do
    assert_difference("OutSite.count") do
      post out_sites_url, params: { out_site: { title: @out_site.title, url: @out_site.url } }
    end

    assert_redirected_to out_site_url(OutSite.last)
  end

  test "should show out_site" do
    get out_site_url(@out_site)
    assert_response :success
  end

  test "should get edit" do
    get edit_out_site_url(@out_site)
    assert_response :success
  end

  test "should update out_site" do
    patch out_site_url(@out_site), params: { out_site: { title: @out_site.title, url: @out_site.url } }
    assert_redirected_to out_site_url(@out_site)
  end

  test "should destroy out_site" do
    assert_difference("OutSite.count", -1) do
      delete out_site_url(@out_site)
    end

    assert_redirected_to out_sites_url
  end
end
