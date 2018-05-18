require 'test_helper'

class DataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @boy_germany = create(:dancer, name: 'Jurgen Klopp', country: 'Germany', is_boy: true)
    @girl_germany = create(:dancer, name: 'Angela Merkel', country: 'Germany', is_boy: false)
    girl_italy = create(:dancer, name: 'Alessandra Elati', country: 'Italy', is_boy: false)
    @couple_italy = create(:couple, boy_id: @boy_germany.id, girl_id: girl_italy.id)
    @couple_germany = create(:couple, boy_id: @boy_germany.id, girl_id: @girl_germany.id)
  end

  test "should show correct couple on query couple diff countries" do
    get international_couples_url
    assert_response :success
    text = "id: #{@couple_italy.id}"
    assert_select 'p', text
  end

  test "should not show incorrect couple on query couple diff countries" do
    get international_couples_url
    assert_response :success
    text = "id: #{@couple_germany.id}"
    assert_select "p", text: text, count: 0
  end

  test "should show correct dancer on query dancer in one couple" do
    get dancers_in_one_couple_url
    assert_response :success
    text = "id: #{@girl_germany.id}"
    assert_select 'p', text
  end

  test "should not show incorrect dancer on query dancer in one couple" do
    get dancers_in_one_couple_url
    assert_response :success
    text = "id: #{@boy_germany.id}"
    assert_select 'p', text: text, count: 0
  end
end
