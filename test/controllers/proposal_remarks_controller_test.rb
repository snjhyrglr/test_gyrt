require "test_helper"

class ProposalRemarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proposal_remark = proposal_remarks(:one)
  end

  test "should get index" do
    get proposal_remarks_url
    assert_response :success
  end

  test "should get new" do
    get new_proposal_remark_url
    assert_response :success
  end

  test "should create proposal_remark" do
    assert_difference("ProposalRemark.count") do
      post proposal_remarks_url, params: { proposal_remark: { gyrt_proposal_id: @proposal_remark.gyrt_proposal_id, remark: @proposal_remark.remark, remark_type: @proposal_remark.remark_type, status: @proposal_remark.status } }
    end

    assert_redirected_to proposal_remark_url(ProposalRemark.last)
  end

  test "should show proposal_remark" do
    get proposal_remark_url(@proposal_remark)
    assert_response :success
  end

  test "should get edit" do
    get edit_proposal_remark_url(@proposal_remark)
    assert_response :success
  end

  test "should update proposal_remark" do
    patch proposal_remark_url(@proposal_remark), params: { proposal_remark: { gyrt_proposal_id: @proposal_remark.gyrt_proposal_id, remark: @proposal_remark.remark, remark_type: @proposal_remark.remark_type, status: @proposal_remark.status } }
    assert_redirected_to proposal_remark_url(@proposal_remark)
  end

  test "should destroy proposal_remark" do
    assert_difference("ProposalRemark.count", -1) do
      delete proposal_remark_url(@proposal_remark)
    end

    assert_redirected_to proposal_remarks_url
  end
end
