require 'test_helper'

class DealingsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get dealings_new_url
    assert_response :success
  end

  test 'should get create' do
    get dealings_create_url
    assert_response :success
  end

  test 'should get index' do
    get dealings_index_url
    assert_response :success
  end

  test 'should get destroy' do
    get dealings_destroy_url
    assert_response :success
  end
end
