require "test_helper"

class GyrtRateMultipliersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gyrt_rate_multiplier = gyrt_rate_multipliers(:one)
  end

  test "should get index" do
    get gyrt_rate_multipliers_url
    assert_response :success
  end

  test "should get new" do
    get new_gyrt_rate_multiplier_url
    assert_response :success
  end

  test "should create gyrt_rate_multiplier" do
    assert_difference("GyrtRateMultiplier.count") do
      post gyrt_rate_multipliers_url, params: { gyrt_rate_multiplier: { benefit_id: @gyrt_rate_multiplier.benefit_id, max_age: @gyrt_rate_multiplier.max_age, min_age: @gyrt_rate_multiplier.min_age, rate: @gyrt_rate_multiplier.rate } }
    end

    assert_redirected_to gyrt_rate_multiplier_url(GyrtRateMultiplier.last)
  end

  test "should show gyrt_rate_multiplier" do
    get gyrt_rate_multiplier_url(@gyrt_rate_multiplier)
    assert_response :success
  end

  test "should get edit" do
    get edit_gyrt_rate_multiplier_url(@gyrt_rate_multiplier)
    assert_response :success
  end

  test "should update gyrt_rate_multiplier" do
    patch gyrt_rate_multiplier_url(@gyrt_rate_multiplier), params: { gyrt_rate_multiplier: { benefit_id: @gyrt_rate_multiplier.benefit_id, max_age: @gyrt_rate_multiplier.max_age, min_age: @gyrt_rate_multiplier.min_age, rate: @gyrt_rate_multiplier.rate } }
    assert_redirected_to gyrt_rate_multiplier_url(@gyrt_rate_multiplier)
  end

  test "should destroy gyrt_rate_multiplier" do
    assert_difference("GyrtRateMultiplier.count", -1) do
      delete gyrt_rate_multiplier_url(@gyrt_rate_multiplier)
    end

    assert_redirected_to gyrt_rate_multipliers_url
  end
end
