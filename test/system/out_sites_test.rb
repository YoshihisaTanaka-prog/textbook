require "application_system_test_case"

class OutSitesTest < ApplicationSystemTestCase
  setup do
    @out_site = out_sites(:one)
  end

  test "visiting the index" do
    visit out_sites_url
    assert_selector "h1", text: "Out sites"
  end

  test "should create out site" do
    visit out_sites_url
    click_on "New out site"

    fill_in "Title", with: @out_site.title
    fill_in "Url", with: @out_site.url
    click_on "Create Out site"

    assert_text "Out site was successfully created"
    click_on "Back"
  end

  test "should update Out site" do
    visit out_site_url(@out_site)
    click_on "Edit this out site", match: :first

    fill_in "Title", with: @out_site.title
    fill_in "Url", with: @out_site.url
    click_on "Update Out site"

    assert_text "Out site was successfully updated"
    click_on "Back"
  end

  test "should destroy Out site" do
    visit out_site_url(@out_site)
    click_on "Destroy this out site", match: :first

    assert_text "Out site was successfully destroyed"
  end
end
