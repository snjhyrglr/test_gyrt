require "application_system_test_case"

class GyrtRateMultipliersTest < ApplicationSystemTestCase
  setup do
    @gyrt_rate_multiplier = gyrt_rate_multipliers(:one)
  end

  test "visiting the index" do
    visit gyrt_rate_multipliers_url
    assert_selector "h1", text: "Gyrt rate multipliers"
  end

  test "should create gyrt rate multiplier" do
    visit gyrt_rate_multipliers_url
    click_on "New gyrt rate multiplier"

    fill_in "Benefit", with: @gyrt_rate_multiplier.benefit_id
    fill_in "Max age", with: @gyrt_rate_multiplier.max_age
    fill_in "Min age", with: @gyrt_rate_multiplier.min_age
    fill_in "Rate", with: @gyrt_rate_multiplier.rate
    click_on "Create Gyrt rate multiplier"

    assert_text "Gyrt rate multiplier was successfully created"
    click_on "Back"
  end

  test "should update Gyrt rate multiplier" do
    visit gyrt_rate_multiplier_url(@gyrt_rate_multiplier)
    click_on "Edit this gyrt rate multiplier", match: :first

    fill_in "Benefit", with: @gyrt_rate_multiplier.benefit_id
    fill_in "Max age", with: @gyrt_rate_multiplier.max_age
    fill_in "Min age", with: @gyrt_rate_multiplier.min_age
    fill_in "Rate", with: @gyrt_rate_multiplier.rate
    click_on "Update Gyrt rate multiplier"

    assert_text "Gyrt rate multiplier was successfully updated"
    click_on "Back"
  end

  test "should destroy Gyrt rate multiplier" do
    visit gyrt_rate_multiplier_url(@gyrt_rate_multiplier)
    click_on "Destroy this gyrt rate multiplier", match: :first

    assert_text "Gyrt rate multiplier was successfully destroyed"
  end
end
