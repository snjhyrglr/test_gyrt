require "application_system_test_case"

class UrdRequirementsTest < ApplicationSystemTestCase
  setup do
    @urd_requirement = urd_requirements(:one)
  end

  test "visiting the index" do
    visit urd_requirements_url
    assert_selector "h1", text: "Urd requirements"
  end

  test "should create urd requirement" do
    visit urd_requirements_url
    click_on "New urd requirement"

    fill_in "Description", with: @urd_requirement.description
    fill_in "Requirement", with: @urd_requirement.requirement
    fill_in "Requirement type", with: @urd_requirement.requirement_type
    click_on "Create Urd requirement"

    assert_text "Urd requirement was successfully created"
    click_on "Back"
  end

  test "should update Urd requirement" do
    visit urd_requirement_url(@urd_requirement)
    click_on "Edit this urd requirement", match: :first

    fill_in "Description", with: @urd_requirement.description
    fill_in "Requirement", with: @urd_requirement.requirement
    fill_in "Requirement type", with: @urd_requirement.requirement_type
    click_on "Update Urd requirement"

    assert_text "Urd requirement was successfully updated"
    click_on "Back"
  end

  test "should destroy Urd requirement" do
    visit urd_requirement_url(@urd_requirement)
    click_on "Destroy this urd requirement", match: :first

    assert_text "Urd requirement was successfully destroyed"
  end
end
