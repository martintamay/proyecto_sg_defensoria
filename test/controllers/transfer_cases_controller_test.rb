require 'test_helper'

class TransferCasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transfer_case = transfer_cases(:one)
  end

  test "should get index" do
    get transfer_cases_url
    assert_response :success
  end

  test "should get new" do
    get new_transfer_case_url
    assert_response :success
  end

  test "should create transfer_case" do
    assert_difference('TransferCase.count') do
      post transfer_cases_url, params: { transfer_case: { comentary: @transfer_case.comentary, date_ttransfer: @transfer_case.date_ttransfer, legal_case_id: @transfer_case.legal_case_id, user_id: @transfer_case.user_id } }
    end

    assert_redirected_to transfer_case_url(TransferCase.last)
  end

  test "should show transfer_case" do
    get transfer_case_url(@transfer_case)
    assert_response :success
  end

  test "should get edit" do
    get edit_transfer_case_url(@transfer_case)
    assert_response :success
  end

  test "should update transfer_case" do
    patch transfer_case_url(@transfer_case), params: { transfer_case: { comentary: @transfer_case.comentary, date_ttransfer: @transfer_case.date_ttransfer, legal_case_id: @transfer_case.legal_case_id, user_id: @transfer_case.user_id } }
    assert_redirected_to transfer_case_url(@transfer_case)
  end

  test "should destroy transfer_case" do
    assert_difference('TransferCase.count', -1) do
      delete transfer_case_url(@transfer_case)
    end

    assert_redirected_to transfer_cases_url
  end
end
