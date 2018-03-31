require 'test_helper'

class FollowsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get follows_index_url
    assert_response :success
  end

  test "should get new" do
    get follows_new_url
    assert_response :success
  end

  test "should get create" do
    get follows_create_url
    assert_response :success
  end

  test "should get edit" do
    get follows_edit_url
    assert_response :success
  end

  test "should get delete" do
    get follows_delete_url
    assert_response :success
  end

  test "should get show" do
    get follows_show_url
    assert_response :success
  end

  test "should get update" do
    get follows_update_url
    assert_response :success
  end

end
