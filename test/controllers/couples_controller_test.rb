require 'test_helper'

class CouplesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @couple_test = couples(:BenedettoAndClaudia)
  end

  test "should get index" do
    get couples_url
    assert_response :success
  end

  test "should get new" do
    get new_couple_url
    assert_response :success
  end

end
