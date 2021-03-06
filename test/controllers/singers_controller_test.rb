require "test_helper"

class SingersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @singer = singers(:one)
  end

  test "should get index" do
    get singers_url
    assert_response :success
  end

  test "should get new" do
    get new_singer_url
    assert_response :success
  end

  test "should create singer" do
    assert_difference('Singer.count') do
      post singers_url, params: { singer: { first_name: @singer.first_name, last_name: @singer.last_name, phone_number: @singer.phone_number } }
    end

    assert_redirected_to singer_url(Singer.last)
  end

  test "should show singer" do
    get singer_url(@singer)
    assert_response :success
  end

  test "should get edit" do
    get edit_singer_url(@singer)
    assert_response :success
  end

  test "should update singer" do
    patch singer_url(@singer), params: { singer: { first_name: @singer.first_name, last_name: @singer.last_name, phone_number: @singer.phone_number } }
    assert_redirected_to singer_url(@singer)
  end

  test "should destroy singer" do
    assert_difference('Singer.count', -1) do
      delete singer_url(@singer)
    end

    assert_redirected_to singers_url
  end
end
