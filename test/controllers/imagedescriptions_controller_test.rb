require 'test_helper'

class ImagedescriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get imagedescriptions_index_url
    assert_response :success
  end

  test "should get edit" do
    get imagedescriptions_edit_url
    assert_response :success
  end

end
