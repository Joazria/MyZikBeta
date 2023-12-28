require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get progress:string" do
    get bookings_progress:string_url
    assert_response :success
  end

  test "should get stage:string" do
    get bookings_stage:string_url
    assert_response :success
  end

  test "should get showtime:datetime" do
    get bookings_showtime:datetime_url
    assert_response :success
  end

  test "should get fee:string" do
    get bookings_fee:string_url
    assert_response :success
  end

  test "should get backline:string" do
    get bookings_backline:string_url
    assert_response :success
  end

  test "should get transporte:string" do
    get bookings_transporte:string_url
    assert_response :success
  end

  test "should get hotel:string" do
    get bookings_hotel:string_url
    assert_response :success
  end

  test "should get food:string" do
    get bookings_food:string_url
    assert_response :success
  end

  test "should get feedback:text" do
    get bookings_feedback:text_url
    assert_response :success
  end

  test "should get next:string" do
    get bookings_next:string_url
    assert_response :success
  end

  test "should get when:datetime" do
    get bookings_when:datetime_url
    assert_response :success
  end

end
