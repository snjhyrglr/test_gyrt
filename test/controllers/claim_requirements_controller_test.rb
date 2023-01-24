require "test_helper"

class ClaimRequirementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @claim_requirement = claim_requirements(:one)
  end

  test "should get index" do
    get claim_requirements_url
    assert_response :success
  end

  test "should get new" do
    get new_claim_requirement_url
    assert_response :success
  end

  test "should create claim_requirement" do
    assert_difference("ClaimRequirement.count") do
      post claim_requirements_url, params: { claim_requirement: { requirement: @claim_requirement.requirement, type: @claim_requirement.type } }
    end

    assert_redirected_to claim_requirement_url(ClaimRequirement.last)
  end

  test "should show claim_requirement" do
    get claim_requirement_url(@claim_requirement)
    assert_response :success
  end

  test "should get edit" do
    get edit_claim_requirement_url(@claim_requirement)
    assert_response :success
  end

  test "should update claim_requirement" do
    patch claim_requirement_url(@claim_requirement), params: { claim_requirement: { requirement: @claim_requirement.requirement, type: @claim_requirement.type } }
    assert_redirected_to claim_requirement_url(@claim_requirement)
  end

  test "should destroy claim_requirement" do
    assert_difference("ClaimRequirement.count", -1) do
      delete claim_requirement_url(@claim_requirement)
    end

    assert_redirected_to claim_requirements_url
  end
end
