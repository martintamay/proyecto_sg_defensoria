require 'test_helper'

class EquipmentDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equipment_detail = equipment_details(:one)
  end

  test "should get index" do
    get equipment_details_url
    assert_response :success
  end

  test "should get new" do
    get new_equipment_detail_url
    assert_response :success
  end

  test "should create equipment_detail" do
    assert_difference('EquipmentDetail.count') do
      post equipment_details_url, params: { equipment_detail: { legal_case_id: @equipment_detail.legal_case_id, user_id: @equipment_detail.user_id } }
    end

    assert_redirected_to equipment_detail_url(EquipmentDetail.last)
  end

  test "should show equipment_detail" do
    get equipment_detail_url(@equipment_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_equipment_detail_url(@equipment_detail)
    assert_response :success
  end

  test "should update equipment_detail" do
    patch equipment_detail_url(@equipment_detail), params: { equipment_detail: { legal_case_id: @equipment_detail.legal_case_id, user_id: @equipment_detail.user_id } }
    assert_redirected_to equipment_detail_url(@equipment_detail)
  end

  test "should destroy equipment_detail" do
    assert_difference('EquipmentDetail.count', -1) do
      delete equipment_detail_url(@equipment_detail)
    end

    assert_redirected_to equipment_details_url
  end
end
