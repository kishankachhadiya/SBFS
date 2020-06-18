require 'test_helper'

class RiggingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rigging = riggings(:one)
  end

  test "should get index" do
    get riggings_url
    assert_response :success
  end

  test "should get new" do
    get new_rigging_url
    assert_response :success
  end

  test "should create rigging" do
    assert_difference('Rigging.count') do
      post riggings_url, params: { rigging: { rigging: @rigging.rigging } }
    end

    assert_redirected_to rigging_url(Rigging.last)
  end

  test "should show rigging" do
    get rigging_url(@rigging)
    assert_response :success
  end

  test "should get edit" do
    get edit_rigging_url(@rigging)
    assert_response :success
  end

  test "should update rigging" do
    patch rigging_url(@rigging), params: { rigging: { rigging: @rigging.rigging } }
    assert_redirected_to rigging_url(@rigging)
  end

  test "should destroy rigging" do
    assert_difference('Rigging.count', -1) do
      delete rigging_url(@rigging)
    end

    assert_redirected_to riggings_url
  end
end
