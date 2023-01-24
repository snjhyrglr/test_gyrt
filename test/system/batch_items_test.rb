require "application_system_test_case"

class BatchItemsTest < ApplicationSystemTestCase
  setup do
    @batch_item = batch_items(:one)
  end

  test "visiting the index" do
    visit batch_items_url
    assert_selector "h1", text: "Batch items"
  end

  test "should create batch item" do
    visit batch_items_url
    click_on "New batch item"

    fill_in "Age", with: @batch_item.age
    fill_in "Batch", with: @batch_item.batch_id
    fill_in "Coop sf", with: @batch_item.coop_sf
    fill_in "Cooperative", with: @batch_item.cooperative_id
    fill_in "Effective date", with: @batch_item.effective_date
    fill_in "Expiry date", with: @batch_item.expiry_date
    fill_in "Gross prem", with: @batch_item.gross_prem
    fill_in "Member", with: @batch_item.member_id
    fill_in "Net prem", with: @batch_item.net_prem
    fill_in "Sum insured", with: @batch_item.sum_insured
    fill_in "Terms", with: @batch_item.terms
    click_on "Create Batch item"

    assert_text "Batch item was successfully created"
    click_on "Back"
  end

  test "should update Batch item" do
    visit batch_item_url(@batch_item)
    click_on "Edit this batch item", match: :first

    fill_in "Age", with: @batch_item.age
    fill_in "Batch", with: @batch_item.batch_id
    fill_in "Coop sf", with: @batch_item.coop_sf
    fill_in "Cooperative", with: @batch_item.cooperative_id
    fill_in "Effective date", with: @batch_item.effective_date
    fill_in "Expiry date", with: @batch_item.expiry_date
    fill_in "Gross prem", with: @batch_item.gross_prem
    fill_in "Member", with: @batch_item.member_id
    fill_in "Net prem", with: @batch_item.net_prem
    fill_in "Sum insured", with: @batch_item.sum_insured
    fill_in "Terms", with: @batch_item.terms
    click_on "Update Batch item"

    assert_text "Batch item was successfully updated"
    click_on "Back"
  end

  test "should destroy Batch item" do
    visit batch_item_url(@batch_item)
    click_on "Destroy this batch item", match: :first

    assert_text "Batch item was successfully destroyed"
  end
end
