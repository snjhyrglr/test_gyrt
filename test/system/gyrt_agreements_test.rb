require "application_system_test_case"

class GyrtAgreementsTest < ApplicationSystemTestCase
  setup do
    @gyrt_agreement = gyrt_agreements(:one)
  end

  test "visiting the index" do
    visit gyrt_agreements_url
    assert_selector "h1", text: "Gyrt agreements"
  end

  test "should create gyrt agreement" do
    visit gyrt_agreements_url
    click_on "New gyrt agreement"

    check "Agent coop status" if @gyrt_agreement.agent_coop_status
    fill_in "Agent sf", with: @gyrt_agreement.agent_sf
    check "Claims status" if @gyrt_agreement.claims_status
    fill_in "Coop sf", with: @gyrt_agreement.coop_sf
    fill_in "Cooperative", with: @gyrt_agreement.cooperative_id
    fill_in "Gyrt proposal", with: @gyrt_agreement.gyrt_proposal_id
    fill_in "Min enrolleess count", with: @gyrt_agreement.min_enrolleess_count
    fill_in "New max age", with: @gyrt_agreement.new_max_age
    fill_in "New min age", with: @gyrt_agreement.new_min_age
    fill_in "Old max age", with: @gyrt_agreement.old_max_age
    fill_in "Old min age", with: @gyrt_agreement.old_min_age
    fill_in "Policy anniv type", with: @gyrt_agreement.policy_anniv_type
    fill_in "Prem rate", with: @gyrt_agreement.prem_rate
    fill_in "Product name", with: @gyrt_agreement.product_name
    fill_in "Rate type", with: @gyrt_agreement.rate_type
    check "Underwriting status" if @gyrt_agreement.underwriting_status
    check "Vp status" if @gyrt_agreement.vp_status
    click_on "Create Gyrt agreement"

    assert_text "Gyrt agreement was successfully created"
    click_on "Back"
  end

  test "should update Gyrt agreement" do
    visit gyrt_agreement_url(@gyrt_agreement)
    click_on "Edit this gyrt agreement", match: :first

    check "Agent coop status" if @gyrt_agreement.agent_coop_status
    fill_in "Agent sf", with: @gyrt_agreement.agent_sf
    check "Claims status" if @gyrt_agreement.claims_status
    fill_in "Coop sf", with: @gyrt_agreement.coop_sf
    fill_in "Cooperative", with: @gyrt_agreement.cooperative_id
    fill_in "Gyrt proposal", with: @gyrt_agreement.gyrt_proposal_id
    fill_in "Min enrolleess count", with: @gyrt_agreement.min_enrolleess_count
    fill_in "New max age", with: @gyrt_agreement.new_max_age
    fill_in "New min age", with: @gyrt_agreement.new_min_age
    fill_in "Old max age", with: @gyrt_agreement.old_max_age
    fill_in "Old min age", with: @gyrt_agreement.old_min_age
    fill_in "Policy anniv type", with: @gyrt_agreement.policy_anniv_type
    fill_in "Prem rate", with: @gyrt_agreement.prem_rate
    fill_in "Product name", with: @gyrt_agreement.product_name
    fill_in "Rate type", with: @gyrt_agreement.rate_type
    check "Underwriting status" if @gyrt_agreement.underwriting_status
    check "Vp status" if @gyrt_agreement.vp_status
    click_on "Update Gyrt agreement"

    assert_text "Gyrt agreement was successfully updated"
    click_on "Back"
  end

  test "should destroy Gyrt agreement" do
    visit gyrt_agreement_url(@gyrt_agreement)
    click_on "Destroy this gyrt agreement", match: :first

    assert_text "Gyrt agreement was successfully destroyed"
  end
end
