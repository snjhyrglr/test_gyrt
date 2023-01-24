require "application_system_test_case"

class GyrtProposalsTest < ApplicationSystemTestCase
  setup do
    @gyrt_proposal = gyrt_proposals(:one)
  end

  test "visiting the index" do
    visit gyrt_proposals_url
    assert_selector "h1", text: "Gyrt proposals"
  end

  test "should create gyrt proposal" do
    visit gyrt_proposals_url
    click_on "New gyrt proposal"

    fill_in "Ave age", with: @gyrt_proposal.ave_age
    fill_in "Cooperative", with: @gyrt_proposal.cooperative_id
    fill_in "Inchage position", with: @gyrt_proposal.inchage_position
    fill_in "Incharge name", with: @gyrt_proposal.incharge_name
    fill_in "Members count", with: @gyrt_proposal.members_count
    fill_in "New max age", with: @gyrt_proposal.new_max_age
    fill_in "New min age", with: @gyrt_proposal.new_min_age
    fill_in "Old max age", with: @gyrt_proposal.old_max_age
    fill_in "Old min age", with: @gyrt_proposal.old_min_age
    fill_in "Total prem", with: @gyrt_proposal.total_prem
    click_on "Create Gyrt proposal"

    assert_text "Gyrt proposal was successfully created"
    click_on "Back"
  end

  test "should update Gyrt proposal" do
    visit gyrt_proposal_url(@gyrt_proposal)
    click_on "Edit this gyrt proposal", match: :first

    fill_in "Ave age", with: @gyrt_proposal.ave_age
    fill_in "Cooperative", with: @gyrt_proposal.cooperative_id
    fill_in "Inchage position", with: @gyrt_proposal.inchage_position
    fill_in "Incharge name", with: @gyrt_proposal.incharge_name
    fill_in "Members count", with: @gyrt_proposal.members_count
    fill_in "New max age", with: @gyrt_proposal.new_max_age
    fill_in "New min age", with: @gyrt_proposal.new_min_age
    fill_in "Old max age", with: @gyrt_proposal.old_max_age
    fill_in "Old min age", with: @gyrt_proposal.old_min_age
    fill_in "Total prem", with: @gyrt_proposal.total_prem
    click_on "Update Gyrt proposal"

    assert_text "Gyrt proposal was successfully updated"
    click_on "Back"
  end

  test "should destroy Gyrt proposal" do
    visit gyrt_proposal_url(@gyrt_proposal)
    click_on "Destroy this gyrt proposal", match: :first

    assert_text "Gyrt proposal was successfully destroyed"
  end
end
