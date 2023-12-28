require 'test_helper'

class IdentitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get username:string" do
    get identities_username:string_url
    assert_response :success
  end

  test "should get country:string" do
    get identities_country:string_url
    assert_response :success
  end

  test "should get state:string" do
    get identities_state:string_url
    assert_response :success
  end

  test "should get city:string" do
    get identities_city:string_url
    assert_response :success
  end

  test "should get language:string" do
    get identities_language:string_url
    assert_response :success
  end

  test "should get release:text" do
    get identities_release:text_url
    assert_response :success
  end

  test "should get member:string" do
    get identities_member:string_url
    assert_response :success
  end

  test "should get whatsapp:string" do
    get identities_whatsapp:string_url
    assert_response :success
  end

end
