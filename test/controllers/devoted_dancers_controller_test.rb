require 'test_helper'

class DevotedDancersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @boy = create(:boy)
    @girl_devoted = create(:girl)
    @girl_devoted_2 = create(:girl)
    create(:couple, boy_id: @boy.id, girl_id: @girl_devoted_2.id)
    create(:couple, boy_id: @boy.id, girl_id: @girl_devoted.id)
  end

  test "should show correct dancer on query dancer in one couple" do
    get devoted_dancers_url
    assert_response :success
    assert_select 'li', count: 2
    assert_select "li[id='"+@girl_devoted.id.to_s+"']"
    assert_select "li[id='"+@girl_devoted_2.id.to_s+"']"
  end

  test "should not show incorrect dancer on query dancer in one couple" do
    get devoted_dancers_url
    assert_response :success
    assert_select "li[id='"+@boy.id.to_s+"']", count: 0
  end
end
