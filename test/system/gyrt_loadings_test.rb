require "application_system_test_case"

class GyrtLoadingsTest < ApplicationSystemTestCase
  setup do
    @gyrt_loading = gyrt_loadings(:one)
  end

  test "visiting the index" do
    visit gyrt_loadings_url
    assert_selector "h1", text: "Gyrt loadings"
  end

  test "should create gyrt loading" do
    visit gyrt_loadings_url
    click_on "New gyrt loading"

    fill_in "Name", with: @gyrt_loading.name
    fill_in "Rate", with: @gyrt_loading.rate
    click_on "Create Gyrt loading"

    assert_text "Gyrt loading was successfully created"
    click_on "Back"
  end

  test "should update Gyrt loading" do
    visit gyrt_loading_url(@gyrt_loading)
    click_on "Edit this gyrt loading", match: :first

    fill_in "Name", with: @gyrt_loading.name
    fill_in "Rate", with: @gyrt_loading.rate
    click_on "Update Gyrt loading"

    assert_text "Gyrt loading was successfully updated"
    click_on "Back"
  end

  test "should destroy Gyrt loading" do
    visit gyrt_loading_url(@gyrt_loading)
    click_on "Destroy this gyrt loading", match: :first

    assert_text "Gyrt loading was successfully destroyed"
  end
end
