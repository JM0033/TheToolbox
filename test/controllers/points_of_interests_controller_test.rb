require "test_helper"

class PointsOfInterestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get points_of_interests_index_url
    assert_response :success
  end

  test "should get show" do
    get points_of_interests_show_url
    assert_response :success
  end
end
