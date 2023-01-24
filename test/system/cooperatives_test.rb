require "application_system_test_case"

class CooperativesTest < ApplicationSystemTestCase
  setup do
    @cooperative = cooperatives(:one)
  end

  test "visiting the index" do
    visit cooperatives_url
    assert_selector "h1", text: "Cooperatives"
  end

  test "should create cooperative" do
    visit cooperatives_url
    click_on "New cooperative"

    fill_in "Address", with: @cooperative.address
    fill_in "Asset size", with: @cooperative.asset_size
    fill_in "Coop category", with: @cooperative.coop_category_id
    fill_in "Coop type", with: @cooperative.coop_type_id
    fill_in "Geo barangay", with: @cooperative.geo_barangay_id
    fill_in "Geo municipality", with: @cooperative.geo_municipality_id
    fill_in "Geo province", with: @cooperative.geo_province_id
    fill_in "Geo region", with: @cooperative.geo_region_id
    fill_in "Name", with: @cooperative.name
    fill_in "Registration no", with: @cooperative.registration_no
    fill_in "Status", with: @cooperative.status
    fill_in "Total asset", with: @cooperative.total_asset
    click_on "Create Cooperative"

    assert_text "Cooperative was successfully created"
    click_on "Back"
  end

  test "should update Cooperative" do
    visit cooperative_url(@cooperative)
    click_on "Edit this cooperative", match: :first

    fill_in "Address", with: @cooperative.address
    fill_in "Asset size", with: @cooperative.asset_size
    fill_in "Coop category", with: @cooperative.coop_category_id
    fill_in "Coop type", with: @cooperative.coop_type_id
    fill_in "Geo barangay", with: @cooperative.geo_barangay_id
    fill_in "Geo municipality", with: @cooperative.geo_municipality_id
    fill_in "Geo province", with: @cooperative.geo_province_id
    fill_in "Geo region", with: @cooperative.geo_region_id
    fill_in "Name", with: @cooperative.name
    fill_in "Registration no", with: @cooperative.registration_no
    fill_in "Status", with: @cooperative.status
    fill_in "Total asset", with: @cooperative.total_asset
    click_on "Update Cooperative"

    assert_text "Cooperative was successfully updated"
    click_on "Back"
  end

  test "should destroy Cooperative" do
    visit cooperative_url(@cooperative)
    click_on "Destroy this cooperative", match: :first

    assert_text "Cooperative was successfully destroyed"
  end
end
