require 'test_helper'

class PicsControllerTest < ActionDispatch::IntegrationTest
  test 'should get destroy' do
    get pics_destroy_url
    assert_response :success
  end
end
