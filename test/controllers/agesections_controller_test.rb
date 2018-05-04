require 'test_helper'

class AgesectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agesection = agesections(:Adult)
  end

  test "should get index" do
    get agesections_url
    assert_response :success
  end

  test "should get new" do
    get new_agesection_url
    assert_response :success
  end

  test "should create agesection" do
    assert_difference('Agesection.count') do
      post agesections_url, params: { agesection: { name: @agesection.name } }
    end

    assert_redirected_to agesection_url(Agesection.last)
  end

  test "should show agesection" do
    get agesection_url(@agesection)
    assert_response :success
  end

  test "should get edit" do
    get edit_agesection_url(@agesection)
    assert_response :success
  end

  test "should update agesection" do
    patch agesection_url(@agesection), params: { agesection: { name: @agesection.name } }
    assert_redirected_to agesection_url(@agesection)
  end

  test "should destroy agesection" do
    assert_difference('Agesection.count', -1) do
      delete agesection_url(@agesection)
    end

    assert_redirected_to agesections_url
  end
end
