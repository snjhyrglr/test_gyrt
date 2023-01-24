require "test_helper"

class CooperativesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cooperative = cooperatives(:one)
  end

  test "should get index" do
    get cooperatives_url
    assert_response :success
  end

  test "should get new" do
    get new_cooperative_url
    assert_response :success
  end

  test "should create cooperative" do
    assert_difference("Cooperative.count") do
      post cooperatives_url, params: { cooperative: { address: @cooperative.address, asset_size: @cooperative.asset_size, coop_category_id: @cooperative.coop_category_id, coop_type_id: @cooperative.coop_type_id, geo_barangay_id: @cooperative.geo_barangay_id, geo_municipality_id: @cooperative.geo_municipality_id, geo_province_id: @cooperative.geo_province_id, geo_region_id: @cooperative.geo_region_id, name: @cooperative.name, registration_no: @cooperative.registration_no, status: @cooperative.status, total_asset: @cooperative.total_asset } }
    end

    assert_redirected_to cooperative_url(Cooperative.last)
  end

  test "should show cooperative" do
    get cooperative_url(@cooperative)
    assert_response :success
  end

  test "should get edit" do
    get edit_cooperative_url(@cooperative)
    assert_response :success
  end

  test "should update cooperative" do
    patch cooperative_url(@cooperative), params: { cooperative: { address: @cooperative.address, asset_size: @cooperative.asset_size, coop_category_id: @cooperative.coop_category_id, coop_type_id: @cooperative.coop_type_id, geo_barangay_id: @cooperative.geo_barangay_id, geo_municipality_id: @cooperative.geo_municipality_id, geo_province_id: @cooperative.geo_province_id, geo_region_id: @cooperative.geo_region_id, name: @cooperative.name, registration_no: @cooperative.registration_no, status: @cooperative.status, total_asset: @cooperative.total_asset } }
    assert_redirected_to cooperative_url(@cooperative)
  end

  test "should destroy cooperative" do
    assert_difference("Cooperative.count", -1) do
      delete cooperative_url(@cooperative)
    end

    assert_redirected_to cooperatives_url
  end
end
