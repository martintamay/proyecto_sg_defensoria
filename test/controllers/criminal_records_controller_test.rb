require 'test_helper'

class CriminalRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @criminal_record = criminal_records(:one)
  end

  test "should get index" do
    get criminal_records_url
    assert_response :success
  end

  test "should get new" do
    get new_criminal_record_url
    assert_response :success
  end

  test "should create criminal_record" do
    assert_difference('CriminalRecord.count') do
      post criminal_records_url, params: { criminal_record: { commission_date: @criminal_record.commission_date, commission_place: @criminal_record.commission_place, inquire_number: @criminal_record.inquire_number, intervention_date: @criminal_record.intervention_date, precautionary_measures: @criminal_record.precautionary_measures, procedural_stage: @criminal_record.procedural_stage, prosecutor_unit: @criminal_record.prosecutor_unit, type_of_crime: @criminal_record.type_of_crime } }
    end

    assert_redirected_to criminal_record_url(CriminalRecord.last)
  end

  test "should show criminal_record" do
    get criminal_record_url(@criminal_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_criminal_record_url(@criminal_record)
    assert_response :success
  end

  test "should update criminal_record" do
    patch criminal_record_url(@criminal_record), params: { criminal_record: { commission_date: @criminal_record.commission_date, commission_place: @criminal_record.commission_place, inquire_number: @criminal_record.inquire_number, intervention_date: @criminal_record.intervention_date, precautionary_measures: @criminal_record.precautionary_measures, procedural_stage: @criminal_record.procedural_stage, prosecutor_unit: @criminal_record.prosecutor_unit, type_of_crime: @criminal_record.type_of_crime } }
    assert_redirected_to criminal_record_url(@criminal_record)
  end

  test "should destroy criminal_record" do
    assert_difference('CriminalRecord.count', -1) do
      delete criminal_record_url(@criminal_record)
    end

    assert_redirected_to criminal_records_url
  end
end
