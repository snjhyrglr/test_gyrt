require "test_helper"

class MatricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @matrix = matrices(:one)
  end

  test "should get index" do
    get matrices_url
    assert_response :success
  end

  test "should get new" do
    get new_matrix_url
    assert_response :success
  end

  test "should create matrix" do
    assert_difference("Matrix.count") do
      post matrices_url, params: { matrix: { cooperative_id: @matrix.cooperative_id, gyrt_proposal_id: @matrix.gyrt_proposal_id, new_max_age: @matrix.new_max_age, new_min_age: @matrix.new_min_age, old_max_age: @matrix.old_max_age, old_min_age: @matrix.old_min_age, prem_rate: @matrix.prem_rate, product_name: @matrix.product_name, proposal_no: @matrix.proposal_no, rate_type: @matrix.rate_type } }
    end

    assert_redirected_to matrix_url(Matrix.last)
  end

  test "should show matrix" do
    get matrix_url(@matrix)
    assert_response :success
  end

  test "should get edit" do
    get edit_matrix_url(@matrix)
    assert_response :success
  end

  test "should update matrix" do
    patch matrix_url(@matrix), params: { matrix: { cooperative_id: @matrix.cooperative_id, gyrt_proposal_id: @matrix.gyrt_proposal_id, new_max_age: @matrix.new_max_age, new_min_age: @matrix.new_min_age, old_max_age: @matrix.old_max_age, old_min_age: @matrix.old_min_age, prem_rate: @matrix.prem_rate, product_name: @matrix.product_name, proposal_no: @matrix.proposal_no, rate_type: @matrix.rate_type } }
    assert_redirected_to matrix_url(@matrix)
  end

  test "should destroy matrix" do
    assert_difference("Matrix.count", -1) do
      delete matrix_url(@matrix)
    end

    assert_redirected_to matrices_url
  end
end
