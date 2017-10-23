require 'test_helper'

class PsygonControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get psygon_index_url
    assert_response :success
  end

end
