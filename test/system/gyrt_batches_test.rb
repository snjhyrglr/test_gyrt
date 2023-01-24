require "application_system_test_case"

class GyrtBatchesTest < ApplicationSystemTestCase
  setup do
    @gyrt_batch = gyrt_batches(:one)
  end

  test "visiting the index" do
    visit gyrt_batches_url
    assert_selector "h1", text: "Gyrt batches"
  end

  test "should create gyrt batch" do
    visit gyrt_batches_url
    click_on "New gyrt batch"

    fill_in "Batch name", with: @gyrt_batch.batch_name
    fill_in "Cooperative", with: @gyrt_batch.cooperative_id
    fill_in "Denied count", with: @gyrt_batch.denied_count
    fill_in "Effective date", with: @gyrt_batch.effective_date
    fill_in "Expiry date", with: @gyrt_batch.expiry_date
    fill_in "Members count", with: @gyrt_batch.members_count
    fill_in "Terms", with: @gyrt_batch.terms
    fill_in "Total coop sf", with: @gyrt_batch.total_coop_sf
    fill_in "Total gross prem", with: @gyrt_batch.total_gross_prem
    fill_in "Total net prem", with: @gyrt_batch.total_net_prem
    click_on "Create Gyrt batch"

    assert_text "Gyrt batch was successfully created"
    click_on "Back"
  end

  test "should update Gyrt batch" do
    visit gyrt_batch_url(@gyrt_batch)
    click_on "Edit this gyrt batch", match: :first

    fill_in "Batch name", with: @gyrt_batch.batch_name
    fill_in "Cooperative", with: @gyrt_batch.cooperative_id
    fill_in "Denied count", with: @gyrt_batch.denied_count
    fill_in "Effective date", with: @gyrt_batch.effective_date
    fill_in "Expiry date", with: @gyrt_batch.expiry_date
    fill_in "Members count", with: @gyrt_batch.members_count
    fill_in "Terms", with: @gyrt_batch.terms
    fill_in "Total coop sf", with: @gyrt_batch.total_coop_sf
    fill_in "Total gross prem", with: @gyrt_batch.total_gross_prem
    fill_in "Total net prem", with: @gyrt_batch.total_net_prem
    click_on "Update Gyrt batch"

    assert_text "Gyrt batch was successfully updated"
    click_on "Back"
  end

  test "should destroy Gyrt batch" do
    visit gyrt_batch_url(@gyrt_batch)
    click_on "Destroy this gyrt batch", match: :first

    assert_text "Gyrt batch was successfully destroyed"
  end
end
