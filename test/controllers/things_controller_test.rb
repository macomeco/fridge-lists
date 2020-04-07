require 'test_helper'

class ThingsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get things_create_url
    assert_response :success
  end

  test "should get destroy" do
    get things_destroy_url
    assert_response :success
  end

  test "should get update" do
    get things_update_url
    assert_response :success
  end

  test "should get edit" do
    get things_edit_url
    assert_response :success
  end

end
