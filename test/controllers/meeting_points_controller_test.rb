require "test_helper"

class MeetingPointsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get meeting_points_create_url
    assert_response :success
  end

  test "should get edit" do
    get meeting_points_edit_url
    assert_response :success
  end

  test "should get update" do
    get meeting_points_update_url
    assert_response :success
  end
end
