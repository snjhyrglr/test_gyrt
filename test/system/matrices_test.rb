require "application_system_test_case"

class MatricesTest < ApplicationSystemTestCase
  setup do
    @matrix = matrices(:one)
  end

  test "visiting the index" do
    visit matrices_url
    assert_selector "h1", text: "Matrices"
  end

  test "should create matrix" do
    visit matrices_url
    click_on "New matrix"

    fill_in "Cooperative", with: @matrix.cooperative_id
    fill_in "Gyrt proposal", with: @matrix.gyrt_proposal_id
    fill_in "New max age", with: @matrix.new_max_age
    fill_in "New min age", with: @matrix.new_min_age
    fill_in "Old max age", with: @matrix.old_max_age
    fill_in "Old min age", with: @matrix.old_min_age
    fill_in "Prem rate", with: @matrix.prem_rate
    fill_in "Product name", with: @matrix.product_name
    fill_in "Proposal no", with: @matrix.proposal_no
    fill_in "Rate type", with: @matrix.rate_type
    click_on "Create Matrix"

    assert_text "Matrix was successfully created"
    click_on "Back"
  end

  test "should update Matrix" do
    visit matrix_url(@matrix)
    click_on "Edit this matrix", match: :first

    fill_in "Cooperative", with: @matrix.cooperative_id
    fill_in "Gyrt proposal", with: @matrix.gyrt_proposal_id
    fill_in "New max age", with: @matrix.new_max_age
    fill_in "New min age", with: @matrix.new_min_age
    fill_in "Old max age", with: @matrix.old_max_age
    fill_in "Old min age", with: @matrix.old_min_age
    fill_in "Prem rate", with: @matrix.prem_rate
    fill_in "Product name", with: @matrix.product_name
    fill_in "Proposal no", with: @matrix.proposal_no
    fill_in "Rate type", with: @matrix.rate_type
    click_on "Update Matrix"

    assert_text "Matrix was successfully updated"
    click_on "Back"
  end

  test "should destroy Matrix" do
    visit matrix_url(@matrix)
    click_on "Destroy this matrix", match: :first

    assert_text "Matrix was successfully destroyed"
  end
end
