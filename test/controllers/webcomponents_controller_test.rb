require 'test_helper'

class WebcomponentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get webcomponents_index_url
    assert_response :success
  end

  test "should get edit" do
    get webcomponents_edit_url
    assert_response :success
  end

end
