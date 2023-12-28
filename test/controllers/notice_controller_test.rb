require 'test_helper'

class NoticeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get notice_index_url
    assert_response :success
  end

  test "should get new" do
    get notice_new_url
    assert_response :success
  end

  test "should get create" do
    get notice_create_url
    assert_response :success
  end

  test "should get show" do
    get notice_show_url
    assert_response :success
  end

  test "should get update" do
    get notice_update_url
    assert_response :success
  end

  test "should get edit" do
    get notice_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get notice_destroy_url
    assert_response :success
  end

end
