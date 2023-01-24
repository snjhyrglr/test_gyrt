require "application_system_test_case"

class GyrtCoveragesTest < ApplicationSystemTestCase
  setup do
    @gyrt_coverage = gyrt_coverages(:one)
  end

  test "visiting the index" do
    visit gyrt_coverages_url
    assert_selector "h1", text: "Gyrt coverages"
  end

  test "should create gyrt coverage" do
    visit gyrt_coverages_url
    click_on "New gyrt coverage"

    fill_in "Age", with: @gyrt_coverage.age
    fill_in "Gross prem", with: @gyrt_coverage.gross_prem
    fill_in "Gyrt batch", with: @gyrt_coverage.gyrt_batch_id
    fill_in "Member", with: @gyrt_coverage.member_id
    fill_in "Status", with: @gyrt_coverage.status
    click_on "Create Gyrt coverage"

    assert_text "Gyrt coverage was successfully created"
    click_on "Back"
  end

  test "should update Gyrt coverage" do
    visit gyrt_coverage_url(@gyrt_coverage)
    click_on "Edit this gyrt coverage", match: :first

    fill_in "Age", with: @gyrt_coverage.age
    fill_in "Gross prem", with: @gyrt_coverage.gross_prem
    fill_in "Gyrt batch", with: @gyrt_coverage.gyrt_batch_id
    fill_in "Member", with: @gyrt_coverage.member_id
    fill_in "Status", with: @gyrt_coverage.status
    click_on "Update Gyrt coverage"

    assert_text "Gyrt coverage was successfully updated"
    click_on "Back"
  end

  test "should destroy Gyrt coverage" do
    visit gyrt_coverage_url(@gyrt_coverage)
    click_on "Destroy this gyrt coverage", match: :first

    assert_text "Gyrt coverage was successfully destroyed"
  end
end
