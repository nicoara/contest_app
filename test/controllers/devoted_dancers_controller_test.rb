require 'test_helper'

class DevotedDancersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @boy_germany = create(:boy, name: 'Jurgen Klopp', country: 'Germany')
    @girl_germany = create(:girl, name: 'Angela Merkel', country: 'Germany')
    girl_italy = create(:girl, name: 'Alessandra Elati', country: 'Italy')
    @couple_diff_country = create(:couple, boy_id: @boy_germany.id, girl_id: girl_italy.id)
    @couple_same_country = create(:couple, boy_id: @boy_germany.id, girl_id: @girl_germany.id)
  end

  test "should show correct dancer on query dancer in one couple" do
    get devoted_dancers_url
    assert_response :success
    text = "id: #{@girl_germany.id}"
    assert_select 'p', text
  end

  test "should not show incorrect dancer on query dancer in one couple" do
    get devoted_dancers_url
    assert_response :success
    text = "id: #{@boy_germany.id}"
    assert_select 'p', text: text, count: 0
  end
end
