require "test_helper"

class GyrtCoveragesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gyrt_coverage = gyrt_coverages(:one)
  end

  test "should get index" do
    get gyrt_coverages_url
    assert_response :success
  end

  test "should get new" do
    get new_gyrt_coverage_url
    assert_response :success
  end

  test "should create gyrt_coverage" do
    assert_difference("GyrtCoverage.count") do
      post gyrt_coverages_url, params: { gyrt_coverage: { age: @gyrt_coverage.age, gross_prem: @gyrt_coverage.gross_prem, gyrt_batch_id: @gyrt_coverage.gyrt_batch_id, member_id: @gyrt_coverage.member_id, status: @gyrt_coverage.status } }
    end

    assert_redirected_to gyrt_coverage_url(GyrtCoverage.last)
  end

  test "should show gyrt_coverage" do
    get gyrt_coverage_url(@gyrt_coverage)
    assert_response :success
  end

  test "should get edit" do
    get edit_gyrt_coverage_url(@gyrt_coverage)
    assert_response :success
  end

  test "should update gyrt_coverage" do
    patch gyrt_coverage_url(@gyrt_coverage), params: { gyrt_coverage: { age: @gyrt_coverage.age, gross_prem: @gyrt_coverage.gross_prem, gyrt_batch_id: @gyrt_coverage.gyrt_batch_id, member_id: @gyrt_coverage.member_id, status: @gyrt_coverage.status } }
    assert_redirected_to gyrt_coverage_url(@gyrt_coverage)
  end

  test "should destroy gyrt_coverage" do
    assert_difference("GyrtCoverage.count", -1) do
      delete gyrt_coverage_url(@gyrt_coverage)
    end

    assert_redirected_to gyrt_coverages_url
  end
end
