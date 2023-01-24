require "test_helper"

class GyrtRatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gyrt_rate = gyrt_rates(:one)
  end

  test "should get index" do
    get gyrt_rates_url
    assert_response :success
  end

  test "should get new" do
    get new_gyrt_rate_url
    assert_response :success
  end

  test "should create gyrt_rate" do
    assert_difference("GyrtRate.count") do
      post gyrt_rates_url, params: { gyrt_rate: { age: @gyrt_rate.age, benefit_id: @gyrt_rate.benefit_id, rate: @gyrt_rate.rate, rate_type: @gyrt_rate.rate_type } }
    end

    assert_redirected_to gyrt_rate_url(GyrtRate.last)
  end

  test "should show gyrt_rate" do
    get gyrt_rate_url(@gyrt_rate)
    assert_response :success
  end

  test "should get edit" do
    get edit_gyrt_rate_url(@gyrt_rate)
    assert_response :success
  end

  test "should update gyrt_rate" do
    patch gyrt_rate_url(@gyrt_rate), params: { gyrt_rate: { age: @gyrt_rate.age, benefit_id: @gyrt_rate.benefit_id, rate: @gyrt_rate.rate, rate_type: @gyrt_rate.rate_type } }
    assert_redirected_to gyrt_rate_url(@gyrt_rate)
  end

  test "should destroy gyrt_rate" do
    assert_difference("GyrtRate.count", -1) do
      delete gyrt_rate_url(@gyrt_rate)
    end

    assert_redirected_to gyrt_rates_url
  end
end
