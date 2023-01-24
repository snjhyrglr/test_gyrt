require "test_helper"

class GyrtLoadingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gyrt_loading = gyrt_loadings(:one)
  end

  test "should get index" do
    get gyrt_loadings_url
    assert_response :success
  end

  test "should get new" do
    get new_gyrt_loading_url
    assert_response :success
  end

  test "should create gyrt_loading" do
    assert_difference("GyrtLoading.count") do
      post gyrt_loadings_url, params: { gyrt_loading: { name: @gyrt_loading.name, rate: @gyrt_loading.rate } }
    end

    assert_redirected_to gyrt_loading_url(GyrtLoading.last)
  end

  test "should show gyrt_loading" do
    get gyrt_loading_url(@gyrt_loading)
    assert_response :success
  end

  test "should get edit" do
    get edit_gyrt_loading_url(@gyrt_loading)
    assert_response :success
  end

  test "should update gyrt_loading" do
    patch gyrt_loading_url(@gyrt_loading), params: { gyrt_loading: { name: @gyrt_loading.name, rate: @gyrt_loading.rate } }
    assert_redirected_to gyrt_loading_url(@gyrt_loading)
  end

  test "should destroy gyrt_loading" do
    assert_difference("GyrtLoading.count", -1) do
      delete gyrt_loading_url(@gyrt_loading)
    end

    assert_redirected_to gyrt_loadings_url
  end
end
