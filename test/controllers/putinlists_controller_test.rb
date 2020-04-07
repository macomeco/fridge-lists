require 'test_helper'

class PutinlistsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get putinlists_create_url
    assert_response :success
  end

  test "should get destroy" do
    get putinlists_destroy_url
    assert_response :success
  end

end
