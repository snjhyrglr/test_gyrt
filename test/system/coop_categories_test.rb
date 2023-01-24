require "application_system_test_case"

class CoopCategoriesTest < ApplicationSystemTestCase
  setup do
    @coop_category = coop_categories(:one)
  end

  test "visiting the index" do
    visit coop_categories_url
    assert_selector "h1", text: "Coop categories"
  end

  test "should create coop category" do
    visit coop_categories_url
    click_on "New coop category"

    fill_in "Name", with: @coop_category.name
    click_on "Create Coop category"

    assert_text "Coop category was successfully created"
    click_on "Back"
  end

  test "should update Coop category" do
    visit coop_category_url(@coop_category)
    click_on "Edit this coop category", match: :first

    fill_in "Name", with: @coop_category.name
    click_on "Update Coop category"

    assert_text "Coop category was successfully updated"
    click_on "Back"
  end

  test "should destroy Coop category" do
    visit coop_category_url(@coop_category)
    click_on "Destroy this coop category", match: :first

    assert_text "Coop category was successfully destroyed"
  end
end
