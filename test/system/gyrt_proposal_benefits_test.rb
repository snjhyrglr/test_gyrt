require "application_system_test_case"

class GyrtProposalBenefitsTest < ApplicationSystemTestCase
  setup do
    @gyrt_proposal_benefit = gyrt_proposal_benefits(:one)
  end

  test "visiting the index" do
    visit gyrt_proposal_benefits_url
    assert_selector "h1", text: "Gyrt proposal benefits"
  end

  test "should create gyrt proposal benefit" do
    visit gyrt_proposal_benefits_url
    click_on "New gyrt proposal benefit"

    fill_in "Base prem", with: @gyrt_proposal_benefit.base_prem
    fill_in "Benefit", with: @gyrt_proposal_benefit.benefit_id
    fill_in "Gyrt proposal", with: @gyrt_proposal_benefit.gyrt_proposal_id
    fill_in "Sum insured", with: @gyrt_proposal_benefit.sum_insured
    click_on "Create Gyrt proposal benefit"

    assert_text "Gyrt proposal benefit was successfully created"
    click_on "Back"
  end

  test "should update Gyrt proposal benefit" do
    visit gyrt_proposal_benefit_url(@gyrt_proposal_benefit)
    click_on "Edit this gyrt proposal benefit", match: :first

    fill_in "Base prem", with: @gyrt_proposal_benefit.base_prem
    fill_in "Benefit", with: @gyrt_proposal_benefit.benefit_id
    fill_in "Gyrt proposal", with: @gyrt_proposal_benefit.gyrt_proposal_id
    fill_in "Sum insured", with: @gyrt_proposal_benefit.sum_insured
    click_on "Update Gyrt proposal benefit"

    assert_text "Gyrt proposal benefit was successfully updated"
    click_on "Back"
  end

  test "should destroy Gyrt proposal benefit" do
    visit gyrt_proposal_benefit_url(@gyrt_proposal_benefit)
    click_on "Destroy this gyrt proposal benefit", match: :first

    assert_text "Gyrt proposal benefit was successfully destroyed"
  end
end
