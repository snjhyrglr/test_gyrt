require "test_helper"

class GyrtProposalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gyrt_proposal = gyrt_proposals(:one)
  end

  test "should get index" do
    get gyrt_proposals_url
    assert_response :success
  end

  test "should get new" do
    get new_gyrt_proposal_url
    assert_response :success
  end

  test "should create gyrt_proposal" do
    assert_difference("GyrtProposal.count") do
      post gyrt_proposals_url, params: { gyrt_proposal: { ave_age: @gyrt_proposal.ave_age, cooperative_id: @gyrt_proposal.cooperative_id, inchage_position: @gyrt_proposal.inchage_position, incharge_name: @gyrt_proposal.incharge_name, members_count: @gyrt_proposal.members_count, new_max_age: @gyrt_proposal.new_max_age, new_min_age: @gyrt_proposal.new_min_age, old_max_age: @gyrt_proposal.old_max_age, old_min_age: @gyrt_proposal.old_min_age, total_prem: @gyrt_proposal.total_prem } }
    end

    assert_redirected_to gyrt_proposal_url(GyrtProposal.last)
  end

  test "should show gyrt_proposal" do
    get gyrt_proposal_url(@gyrt_proposal)
    assert_response :success
  end

  test "should get edit" do
    get edit_gyrt_proposal_url(@gyrt_proposal)
    assert_response :success
  end

  test "should update gyrt_proposal" do
    patch gyrt_proposal_url(@gyrt_proposal), params: { gyrt_proposal: { ave_age: @gyrt_proposal.ave_age, cooperative_id: @gyrt_proposal.cooperative_id, inchage_position: @gyrt_proposal.inchage_position, incharge_name: @gyrt_proposal.incharge_name, members_count: @gyrt_proposal.members_count, new_max_age: @gyrt_proposal.new_max_age, new_min_age: @gyrt_proposal.new_min_age, old_max_age: @gyrt_proposal.old_max_age, old_min_age: @gyrt_proposal.old_min_age, total_prem: @gyrt_proposal.total_prem } }
    assert_redirected_to gyrt_proposal_url(@gyrt_proposal)
  end

  test "should destroy gyrt_proposal" do
    assert_difference("GyrtProposal.count", -1) do
      delete gyrt_proposal_url(@gyrt_proposal)
    end

    assert_redirected_to gyrt_proposals_url
  end
end
