require 'test_helper'

class TeachingPositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teaching_position = teaching_positions(:one)
  end

  test "should get index" do
    get teaching_positions_url
    assert_response :success
  end

  test "should get new" do
    get new_teaching_position_url
    assert_response :success
  end

  test "should create teaching_position" do
    assert_difference('TeachingPosition.count') do
      post teaching_positions_url, params: { teaching_position: { school_id: @teaching_position.school_id, teacher_id: @teaching_position.teacher_id } }
    end

    assert_redirected_to teaching_position_url(TeachingPosition.last)
  end

  test "should show teaching_position" do
    get teaching_position_url(@teaching_position)
    assert_response :success
  end

  test "should get edit" do
    get edit_teaching_position_url(@teaching_position)
    assert_response :success
  end

  test "should update teaching_position" do
    patch teaching_position_url(@teaching_position), params: { teaching_position: { school_id: @teaching_position.school_id, teacher_id: @teaching_position.teacher_id } }
    assert_redirected_to teaching_position_url(@teaching_position)
  end

  test "should destroy teaching_position" do
    assert_difference('TeachingPosition.count', -1) do
      delete teaching_position_url(@teaching_position)
    end

    assert_redirected_to teaching_positions_url
  end
end
