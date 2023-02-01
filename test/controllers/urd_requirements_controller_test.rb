require "test_helper"

class UrdRequirementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @urd_requirement = urd_requirements(:one)
  end

  test "should get index" do
    get urd_requirements_url
    assert_response :success
  end

  test "should get new" do
    get new_urd_requirement_url
    assert_response :success
  end

  test "should create urd_requirement" do
    assert_difference("UrdRequirement.count") do
      post urd_requirements_url, params: { urd_requirement: { description: @urd_requirement.description, requirement: @urd_requirement.requirement, requirement_type: @urd_requirement.requirement_type } }
    end

    assert_redirected_to urd_requirement_url(UrdRequirement.last)
  end

  test "should show urd_requirement" do
    get urd_requirement_url(@urd_requirement)
    assert_response :success
  end

  test "should get edit" do
    get edit_urd_requirement_url(@urd_requirement)
    assert_response :success
  end

  test "should update urd_requirement" do
    patch urd_requirement_url(@urd_requirement), params: { urd_requirement: { description: @urd_requirement.description, requirement: @urd_requirement.requirement, requirement_type: @urd_requirement.requirement_type } }
    assert_redirected_to urd_requirement_url(@urd_requirement)
  end

  test "should destroy urd_requirement" do
    assert_difference("UrdRequirement.count", -1) do
      delete urd_requirement_url(@urd_requirement)
    end

    assert_redirected_to urd_requirements_url
  end
end
