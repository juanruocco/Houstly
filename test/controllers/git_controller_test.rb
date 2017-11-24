require 'test_helper'

class GitControllerTest < ActionDispatch::IntegrationTest
  test "should get status" do
    get git_status_url
    assert_response :success
  end

end
