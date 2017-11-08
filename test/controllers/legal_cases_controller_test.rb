require 'test_helper'

class LegalCasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @legal_case = legal_cases(:one)
  end

  test "should get index" do
    get legal_cases_url
    assert_response :success
  end

  test "should get new" do
    get new_legal_case_url
    assert_response :success
  end

  test "should create legal_case" do
    assert_difference('LegalCase.count') do
      post legal_cases_url, params: { legal_case: { comment: @legal_case.comment, court_id: @legal_case.court_id, criminal_record_id: @legal_case.criminal_record_id, entry_form: @legal_case.entry_form, final_sentence: @legal_case.final_sentence, judge_id: @legal_case.judge_id, name: @legal_case.name, suspect_id: @legal_case.suspect_id, user_id: @legal_case.user_id } }
    end

    assert_redirected_to legal_case_url(LegalCase.last)
  end

  test "should show legal_case" do
    get legal_case_url(@legal_case)
    assert_response :success
  end

  test "should get edit" do
    get edit_legal_case_url(@legal_case)
    assert_response :success
  end

  test "should update legal_case" do
    patch legal_case_url(@legal_case), params: { legal_case: { comment: @legal_case.comment, court_id: @legal_case.court_id, criminal_record_id: @legal_case.criminal_record_id, entry_form: @legal_case.entry_form, final_sentence: @legal_case.final_sentence, judge_id: @legal_case.judge_id, name: @legal_case.name, suspect_id: @legal_case.suspect_id, user_id: @legal_case.user_id } }
    assert_redirected_to legal_case_url(@legal_case)
  end

  test "should destroy legal_case" do
    assert_difference('LegalCase.count', -1) do
      delete legal_case_url(@legal_case)
    end

    assert_redirected_to legal_cases_url
  end
end
