require 'test_helper'

class InfosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get infos_index_url
    assert_response :success
  end

  test "should get show" do
    get infos_show_url
    assert_response :success
  end

  test "should get new" do
    get infos_new_url
    assert_response :success
  end

  test "should get create" do
    get infos_create_url
    assert_response :success
  end

  test "should get update" do
    get infos_update_url
    assert_response :success
  end

  test "should get edit" do
    get infos_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get infos_destroy_url
    assert_response :success
  end

end
