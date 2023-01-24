require "application_system_test_case"

class ClaimRequirementsTest < ApplicationSystemTestCase
  setup do
    @claim_requirement = claim_requirements(:one)
  end

  test "visiting the index" do
    visit claim_requirements_url
    assert_selector "h1", text: "Claim requirements"
  end

  test "should create claim requirement" do
    visit claim_requirements_url
    click_on "New claim requirement"

    fill_in "Requirement", with: @claim_requirement.requirement
    fill_in "Type", with: @claim_requirement.type
    click_on "Create Claim requirement"

    assert_text "Claim requirement was successfully created"
    click_on "Back"
  end

  test "should update Claim requirement" do
    visit claim_requirement_url(@claim_requirement)
    click_on "Edit this claim requirement", match: :first

    fill_in "Requirement", with: @claim_requirement.requirement
    fill_in "Type", with: @claim_requirement.type
    click_on "Update Claim requirement"

    assert_text "Claim requirement was successfully updated"
    click_on "Back"
  end

  test "should destroy Claim requirement" do
    visit claim_requirement_url(@claim_requirement)
    click_on "Destroy this claim requirement", match: :first

    assert_text "Claim requirement was successfully destroyed"
  end
end
