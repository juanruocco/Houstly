require 'test_helper'

class CommonareaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get commonarea_index_url
    assert_response :success
  end

  test "should get create" do
    get commonarea_create_url
    assert_response :success
  end

  test "should get update" do
    get commonarea_update_url
    assert_response :success
  end

end
