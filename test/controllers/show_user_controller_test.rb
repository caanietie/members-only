require "test_helper"

class ShowUserControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get show_user_show_url
    assert_response :success
  end
end
