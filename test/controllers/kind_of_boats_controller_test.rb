require 'test_helper'

class KindOfBoatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kind_of_boat = kind_of_boats(:one)
  end

  test "should get index" do
    get kind_of_boats_url
    assert_response :success
  end

  test "should get new" do
    get new_kind_of_boat_url
    assert_response :success
  end

  test "should create kind_of_boat" do
    assert_difference('KindOfBoat.count') do
      post kind_of_boats_url, params: { kind_of_boat: { kind: @kind_of_boat.kind } }
    end

    assert_redirected_to kind_of_boat_url(KindOfBoat.last)
  end

  test "should show kind_of_boat" do
    get kind_of_boat_url(@kind_of_boat)
    assert_response :success
  end

  test "should get edit" do
    get edit_kind_of_boat_url(@kind_of_boat)
    assert_response :success
  end

  test "should update kind_of_boat" do
    patch kind_of_boat_url(@kind_of_boat), params: { kind_of_boat: { kind: @kind_of_boat.kind } }
    assert_redirected_to kind_of_boat_url(@kind_of_boat)
  end

  test "should destroy kind_of_boat" do
    assert_difference('KindOfBoat.count', -1) do
      delete kind_of_boat_url(@kind_of_boat)
    end

    assert_redirected_to kind_of_boats_url
  end
end
