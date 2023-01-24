require "test_helper"

class GyrtBatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gyrt_batch = gyrt_batches(:one)
  end

  test "should get index" do
    get gyrt_batches_url
    assert_response :success
  end

  test "should get new" do
    get new_gyrt_batch_url
    assert_response :success
  end

  test "should create gyrt_batch" do
    assert_difference("GyrtBatch.count") do
      post gyrt_batches_url, params: { gyrt_batch: { batch_name: @gyrt_batch.batch_name, cooperative_id: @gyrt_batch.cooperative_id, denied_count: @gyrt_batch.denied_count, effective_date: @gyrt_batch.effective_date, expiry_date: @gyrt_batch.expiry_date, members_count: @gyrt_batch.members_count, terms: @gyrt_batch.terms, total_coop_sf: @gyrt_batch.total_coop_sf, total_gross_prem: @gyrt_batch.total_gross_prem, total_net_prem: @gyrt_batch.total_net_prem } }
    end

    assert_redirected_to gyrt_batch_url(GyrtBatch.last)
  end

  test "should show gyrt_batch" do
    get gyrt_batch_url(@gyrt_batch)
    assert_response :success
  end

  test "should get edit" do
    get edit_gyrt_batch_url(@gyrt_batch)
    assert_response :success
  end

  test "should update gyrt_batch" do
    patch gyrt_batch_url(@gyrt_batch), params: { gyrt_batch: { batch_name: @gyrt_batch.batch_name, cooperative_id: @gyrt_batch.cooperative_id, denied_count: @gyrt_batch.denied_count, effective_date: @gyrt_batch.effective_date, expiry_date: @gyrt_batch.expiry_date, members_count: @gyrt_batch.members_count, terms: @gyrt_batch.terms, total_coop_sf: @gyrt_batch.total_coop_sf, total_gross_prem: @gyrt_batch.total_gross_prem, total_net_prem: @gyrt_batch.total_net_prem } }
    assert_redirected_to gyrt_batch_url(@gyrt_batch)
  end

  test "should destroy gyrt_batch" do
    assert_difference("GyrtBatch.count", -1) do
      delete gyrt_batch_url(@gyrt_batch)
    end

    assert_redirected_to gyrt_batches_url
  end
end
