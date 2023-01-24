require "application_system_test_case"

class GyrtRatesTest < ApplicationSystemTestCase
  setup do
    @gyrt_rate = gyrt_rates(:one)
  end

  test "visiting the index" do
    visit gyrt_rates_url
    assert_selector "h1", text: "Gyrt rates"
  end

  test "should create gyrt rate" do
    visit gyrt_rates_url
    click_on "New gyrt rate"

    fill_in "Age", with: @gyrt_rate.age
    fill_in "Benefit", with: @gyrt_rate.benefit_id
    fill_in "Rate", with: @gyrt_rate.rate
    fill_in "Rate type", with: @gyrt_rate.rate_type
    click_on "Create Gyrt rate"

    assert_text "Gyrt rate was successfully created"
    click_on "Back"
  end

  test "should update Gyrt rate" do
    visit gyrt_rate_url(@gyrt_rate)
    click_on "Edit this gyrt rate", match: :first

    fill_in "Age", with: @gyrt_rate.age
    fill_in "Benefit", with: @gyrt_rate.benefit_id
    fill_in "Rate", with: @gyrt_rate.rate
    fill_in "Rate type", with: @gyrt_rate.rate_type
    click_on "Update Gyrt rate"

    assert_text "Gyrt rate was successfully updated"
    click_on "Back"
  end

  test "should destroy Gyrt rate" do
    visit gyrt_rate_url(@gyrt_rate)
    click_on "Destroy this gyrt rate", match: :first

    assert_text "Gyrt rate was successfully destroyed"
  end
end
