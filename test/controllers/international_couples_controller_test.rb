require 'test_helper'

class InternationalCouplesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @boy_germany = create(:boy, country: 'Germany')
    @girl_germany = create(:girl, country: 'Germany')
    boy_romania = create(:boy, country:'Romania')
    girl_italy = create(:girl, country: 'Italy')
    @couple_diff_country = create(:couple, boy_id: @boy_germany.id, girl_id: girl_italy.id)
    @couple_diff_country_2 = create(:couple, boy_id: boy_romania.id, girl_id: girl_italy.id)
    @couple_same_country = create(:couple, boy_id: @boy_germany.id, girl_id: @girl_germany.id)
  end

  test "should show correct couple on query couple diff countries" do
    get international_couples_url
    assert_response :success
    assert_select 'li', count: 2
    assert_select "li[id='#{@couple_diff_country.id.to_s}']"
    assert_select "li[id='#{@couple_diff_country_2.id.to_s}']"
  end

  test "should not show incorrect couple on query couple diff countries" do
    get international_couples_url
    assert_response :success
    assert_select "li[id='#{@couple_same_country.id.to_s}']", count: 0
  end
end
