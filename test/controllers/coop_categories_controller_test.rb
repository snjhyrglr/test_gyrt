require "test_helper"

class CoopCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coop_category = coop_categories(:one)
  end

  test "should get index" do
    get coop_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_coop_category_url
    assert_response :success
  end

  test "should create coop_category" do
    assert_difference("CoopCategory.count") do
      post coop_categories_url, params: { coop_category: { name: @coop_category.name } }
    end

    assert_redirected_to coop_category_url(CoopCategory.last)
  end

  test "should show coop_category" do
    get coop_category_url(@coop_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_coop_category_url(@coop_category)
    assert_response :success
  end

  test "should update coop_category" do
    patch coop_category_url(@coop_category), params: { coop_category: { name: @coop_category.name } }
    assert_redirected_to coop_category_url(@coop_category)
  end

  test "should destroy coop_category" do
    assert_difference("CoopCategory.count", -1) do
      delete coop_category_url(@coop_category)
    end

    assert_redirected_to coop_categories_url
  end
end
