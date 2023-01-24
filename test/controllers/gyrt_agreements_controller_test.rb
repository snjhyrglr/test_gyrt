require "test_helper"

class GyrtAgreementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gyrt_agreement = gyrt_agreements(:one)
  end

  test "should get index" do
    get gyrt_agreements_url
    assert_response :success
  end

  test "should get new" do
    get new_gyrt_agreement_url
    assert_response :success
  end

  test "should create gyrt_agreement" do
    assert_difference("GyrtAgreement.count") do
      post gyrt_agreements_url, params: { gyrt_agreement: { agent_coop_status: @gyrt_agreement.agent_coop_status, agent_sf: @gyrt_agreement.agent_sf, claims_status: @gyrt_agreement.claims_status, coop_sf: @gyrt_agreement.coop_sf, cooperative_id: @gyrt_agreement.cooperative_id, gyrt_proposal_id: @gyrt_agreement.gyrt_proposal_id, min_enrolleess_count: @gyrt_agreement.min_enrolleess_count, new_max_age: @gyrt_agreement.new_max_age, new_min_age: @gyrt_agreement.new_min_age, old_max_age: @gyrt_agreement.old_max_age, old_min_age: @gyrt_agreement.old_min_age, policy_anniv_type: @gyrt_agreement.policy_anniv_type, prem_rate: @gyrt_agreement.prem_rate, product_name: @gyrt_agreement.product_name, rate_type: @gyrt_agreement.rate_type, underwriting_status: @gyrt_agreement.underwriting_status, vp_status: @gyrt_agreement.vp_status } }
    end

    assert_redirected_to gyrt_agreement_url(GyrtAgreement.last)
  end

  test "should show gyrt_agreement" do
    get gyrt_agreement_url(@gyrt_agreement)
    assert_response :success
  end

  test "should get edit" do
    get edit_gyrt_agreement_url(@gyrt_agreement)
    assert_response :success
  end

  test "should update gyrt_agreement" do
    patch gyrt_agreement_url(@gyrt_agreement), params: { gyrt_agreement: { agent_coop_status: @gyrt_agreement.agent_coop_status, agent_sf: @gyrt_agreement.agent_sf, claims_status: @gyrt_agreement.claims_status, coop_sf: @gyrt_agreement.coop_sf, cooperative_id: @gyrt_agreement.cooperative_id, gyrt_proposal_id: @gyrt_agreement.gyrt_proposal_id, min_enrolleess_count: @gyrt_agreement.min_enrolleess_count, new_max_age: @gyrt_agreement.new_max_age, new_min_age: @gyrt_agreement.new_min_age, old_max_age: @gyrt_agreement.old_max_age, old_min_age: @gyrt_agreement.old_min_age, policy_anniv_type: @gyrt_agreement.policy_anniv_type, prem_rate: @gyrt_agreement.prem_rate, product_name: @gyrt_agreement.product_name, rate_type: @gyrt_agreement.rate_type, underwriting_status: @gyrt_agreement.underwriting_status, vp_status: @gyrt_agreement.vp_status } }
    assert_redirected_to gyrt_agreement_url(@gyrt_agreement)
  end

  test "should destroy gyrt_agreement" do
    assert_difference("GyrtAgreement.count", -1) do
      delete gyrt_agreement_url(@gyrt_agreement)
    end

    assert_redirected_to gyrt_agreements_url
  end
end
