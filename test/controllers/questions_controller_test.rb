require "test_helper"

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get questions_index_url
    assert_response :success
  end

  test "should get show" do
    get questions_show_url
    assert_response :success
  end
end
