require "test_helper"

class Saab900ControllerTest < ActionDispatch::IntegrationTest
  test "get show" do
    get root_path
    assert_response :success
  end
end
