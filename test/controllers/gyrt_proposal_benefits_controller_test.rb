require "test_helper"

class GyrtProposalBenefitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gyrt_proposal_benefit = gyrt_proposal_benefits(:one)
  end

  test "should get index" do
    get gyrt_proposal_benefits_url
    assert_response :success
  end

  test "should get new" do
    get new_gyrt_proposal_benefit_url
    assert_response :success
  end

  test "should create gyrt_proposal_benefit" do
    assert_difference("GyrtProposalBenefit.count") do
      post gyrt_proposal_benefits_url, params: { gyrt_proposal_benefit: { base_prem: @gyrt_proposal_benefit.base_prem, benefit_id: @gyrt_proposal_benefit.benefit_id, gyrt_proposal_id: @gyrt_proposal_benefit.gyrt_proposal_id, sum_insured: @gyrt_proposal_benefit.sum_insured } }
    end

    assert_redirected_to gyrt_proposal_benefit_url(GyrtProposalBenefit.last)
  end

  test "should show gyrt_proposal_benefit" do
    get gyrt_proposal_benefit_url(@gyrt_proposal_benefit)
    assert_response :success
  end

  test "should get edit" do
    get edit_gyrt_proposal_benefit_url(@gyrt_proposal_benefit)
    assert_response :success
  end

  test "should update gyrt_proposal_benefit" do
    patch gyrt_proposal_benefit_url(@gyrt_proposal_benefit), params: { gyrt_proposal_benefit: { base_prem: @gyrt_proposal_benefit.base_prem, benefit_id: @gyrt_proposal_benefit.benefit_id, gyrt_proposal_id: @gyrt_proposal_benefit.gyrt_proposal_id, sum_insured: @gyrt_proposal_benefit.sum_insured } }
    assert_redirected_to gyrt_proposal_benefit_url(@gyrt_proposal_benefit)
  end

  test "should destroy gyrt_proposal_benefit" do
    assert_difference("GyrtProposalBenefit.count", -1) do
      delete gyrt_proposal_benefit_url(@gyrt_proposal_benefit)
    end

    assert_redirected_to gyrt_proposal_benefits_url
  end
end
