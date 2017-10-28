require 'test_helper'

class CommonAreasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get common_areas_index_url
    assert_response :success
  end

  test "should get create" do
    get common_areas_create_url
    assert_response :success
  end

  test "should get update" do
    get common_areas_update_url
    assert_response :success
  end

end
