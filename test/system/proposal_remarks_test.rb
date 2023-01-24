require "application_system_test_case"

class ProposalRemarksTest < ApplicationSystemTestCase
  setup do
    @proposal_remark = proposal_remarks(:one)
  end

  test "visiting the index" do
    visit proposal_remarks_url
    assert_selector "h1", text: "Proposal remarks"
  end

  test "should create proposal remark" do
    visit proposal_remarks_url
    click_on "New proposal remark"

    fill_in "Gyrt proposal", with: @proposal_remark.gyrt_proposal_id
    fill_in "Remark", with: @proposal_remark.remark
    fill_in "Remark type", with: @proposal_remark.remark_type
    fill_in "Status", with: @proposal_remark.status
    click_on "Create Proposal remark"

    assert_text "Proposal remark was successfully created"
    click_on "Back"
  end

  test "should update Proposal remark" do
    visit proposal_remark_url(@proposal_remark)
    click_on "Edit this proposal remark", match: :first

    fill_in "Gyrt proposal", with: @proposal_remark.gyrt_proposal_id
    fill_in "Remark", with: @proposal_remark.remark
    fill_in "Remark type", with: @proposal_remark.remark_type
    fill_in "Status", with: @proposal_remark.status
    click_on "Update Proposal remark"

    assert_text "Proposal remark was successfully updated"
    click_on "Back"
  end

  test "should destroy Proposal remark" do
    visit proposal_remark_url(@proposal_remark)
    click_on "Destroy this proposal remark", match: :first

    assert_text "Proposal remark was successfully destroyed"
  end
end
