require 'test_helper'

class TeacherRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teacher_request = teacher_requests(:one)
  end

  test "should get index" do
    get teacher_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_teacher_request_url
    assert_response :success
  end

  test "should create teacher_request" do
    assert_difference('TeacherRequest.count') do
      post teacher_requests_url, params: { teacher_request: { closed_at: @teacher_request.closed_at, description: @teacher_request.description, teaching_position_id: @teacher_request.teaching_position_id } }
    end

    assert_redirected_to teacher_request_url(TeacherRequest.last)
  end

  test "should show teacher_request" do
    get teacher_request_url(@teacher_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_teacher_request_url(@teacher_request)
    assert_response :success
  end

  test "should update teacher_request" do
    patch teacher_request_url(@teacher_request), params: { teacher_request: { closed_at: @teacher_request.closed_at, description: @teacher_request.description, teaching_position_id: @teacher_request.teaching_position_id } }
    assert_redirected_to teacher_request_url(@teacher_request)
  end

  test "should destroy teacher_request" do
    assert_difference('TeacherRequest.count', -1) do
      delete teacher_request_url(@teacher_request)
    end

    assert_redirected_to teacher_requests_url
  end
end
