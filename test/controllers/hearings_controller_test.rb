require 'test_helper'

class HearingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hearing = hearings(:one)
  end

  test "should get index" do
    get hearings_url
    assert_response :success
  end

  test "should get new" do
    get new_hearing_url
    assert_response :success
  end

  test "should create hearing" do
    assert_difference('Hearing.count') do
      post hearings_url, params: { hearing: { hearing_date: @hearing.hearing_date, legal_case_id: @hearing.legal_case_id, user_id: @hearing.user_id } }
    end

    assert_redirected_to hearing_url(Hearing.last)
  end

  test "should show hearing" do
    get hearing_url(@hearing)
    assert_response :success
  end

  test "should get edit" do
    get edit_hearing_url(@hearing)
    assert_response :success
  end

  test "should update hearing" do
    patch hearing_url(@hearing), params: { hearing: { hearing_date: @hearing.hearing_date, legal_case_id: @hearing.legal_case_id, user_id: @hearing.user_id } }
    assert_redirected_to hearing_url(@hearing)
  end

  test "should destroy hearing" do
    assert_difference('Hearing.count', -1) do
      delete hearing_url(@hearing)
    end

    assert_redirected_to hearings_url
  end
end
