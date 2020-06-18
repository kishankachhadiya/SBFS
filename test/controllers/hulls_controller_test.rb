require 'test_helper'

class HullsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hull = hulls(:one)
  end

  test "should get index" do
    get hulls_url
    assert_response :success
  end

  test "should get new" do
    get new_hull_url
    assert_response :success
  end

  test "should create hull" do
    assert_difference('Hull.count') do
      post hulls_url, params: { hull: { hull: @hull.hull } }
    end

    assert_redirected_to hull_url(Hull.last)
  end

  test "should show hull" do
    get hull_url(@hull)
    assert_response :success
  end

  test "should get edit" do
    get edit_hull_url(@hull)
    assert_response :success
  end

  test "should update hull" do
    patch hull_url(@hull), params: { hull: { hull: @hull.hull } }
    assert_redirected_to hull_url(@hull)
  end

  test "should destroy hull" do
    assert_difference('Hull.count', -1) do
      delete hull_url(@hull)
    end

    assert_redirected_to hulls_url
  end
end
