require 'test_helper'

class LawyerActionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lawyer_action = lawyer_actions(:one)
  end

  test "should get index" do
    get lawyer_actions_url
    assert_response :success
  end

  test "should get new" do
    get new_lawyer_action_url
    assert_response :success
  end

  test "should create lawyer_action" do
    assert_difference('LawyerAction.count') do
      post lawyer_actions_url, params: { lawyer_action: { action_date: @lawyer_action.action_date, comment: @lawyer_action.comment, legal_case_id: @lawyer_action.legal_case_id } }
    end

    assert_redirected_to lawyer_action_url(LawyerAction.last)
  end

  test "should show lawyer_action" do
    get lawyer_action_url(@lawyer_action)
    assert_response :success
  end

  test "should get edit" do
    get edit_lawyer_action_url(@lawyer_action)
    assert_response :success
  end

  test "should update lawyer_action" do
    patch lawyer_action_url(@lawyer_action), params: { lawyer_action: { action_date: @lawyer_action.action_date, comment: @lawyer_action.comment, legal_case_id: @lawyer_action.legal_case_id } }
    assert_redirected_to lawyer_action_url(@lawyer_action)
  end

  test "should destroy lawyer_action" do
    assert_difference('LawyerAction.count', -1) do
      delete lawyer_action_url(@lawyer_action)
    end

    assert_redirected_to lawyer_actions_url
  end
end
