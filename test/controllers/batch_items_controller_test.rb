require "test_helper"

class BatchItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @batch_item = batch_items(:one)
  end

  test "should get index" do
    get batch_items_url
    assert_response :success
  end

  test "should get new" do
    get new_batch_item_url
    assert_response :success
  end

  test "should create batch_item" do
    assert_difference("BatchItem.count") do
      post batch_items_url, params: { batch_item: { age: @batch_item.age, batch_id: @batch_item.batch_id, coop_sf: @batch_item.coop_sf, cooperative_id: @batch_item.cooperative_id, effective_date: @batch_item.effective_date, expiry_date: @batch_item.expiry_date, gross_prem: @batch_item.gross_prem, member_id: @batch_item.member_id, net_prem: @batch_item.net_prem, sum_insured: @batch_item.sum_insured, terms: @batch_item.terms } }
    end

    assert_redirected_to batch_item_url(BatchItem.last)
  end

  test "should show batch_item" do
    get batch_item_url(@batch_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_batch_item_url(@batch_item)
    assert_response :success
  end

  test "should update batch_item" do
    patch batch_item_url(@batch_item), params: { batch_item: { age: @batch_item.age, batch_id: @batch_item.batch_id, coop_sf: @batch_item.coop_sf, cooperative_id: @batch_item.cooperative_id, effective_date: @batch_item.effective_date, expiry_date: @batch_item.expiry_date, gross_prem: @batch_item.gross_prem, member_id: @batch_item.member_id, net_prem: @batch_item.net_prem, sum_insured: @batch_item.sum_insured, terms: @batch_item.terms } }
    assert_redirected_to batch_item_url(@batch_item)
  end

  test "should destroy batch_item" do
    assert_difference("BatchItem.count", -1) do
      delete batch_item_url(@batch_item)
    end

    assert_redirected_to batch_items_url
  end
end
