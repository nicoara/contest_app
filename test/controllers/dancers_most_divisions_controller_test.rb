require 'test_helper'

class DancersMostDivisionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @boy_most_divisions = create(:boy)
    @boy_2 = create(:boy)
    @girl_most_divisions = create(:girl)
    girl_2 = create(:girl)
    couple = create(:couple, boy_id: @boy_most_divisions.id, girl_id: girl_2.id)
    couple_2 = create(:couple, boy_id: @boy_most_divisions.id, girl_id: @girl_most_divisions.id)
    couple_3 = create(:couple, boy_id: @boy_2.id, girl_id: @girl_most_divisions.id)

    competition = create(:competition)
    division = create(:division, ranking: 1)
    division_2 = create(:division, ranking: 2)
    age_section = create(:age_section)
    create(:entry, couple_id: couple.id, competition_id: competition.id,
                      division_id: division.id, age_section_id: age_section.id)
    create(:entry, couple_id: couple_2.id, competition_id: competition.id,
                      division_id: division_2.id, age_section_id: age_section.id)
    create(:entry, couple_id: couple_3.id, competition_id: competition.id,
                      division_id: division.id, age_section_id: age_section.id)
  end

  test "should show correct dancer with most divisions" do
    get dancers_most_divisions_url
    assert_response :success
    assert_select 'li', count: 2
    assert_select "li[id='#{@boy_most_divisions.id.to_s}']"
    assert_select "li[id='#{@girl_most_divisions.id.to_s}']"
  end

  test "should not show incorrect dancer with most divisions" do
    get dancers_most_divisions_url
    assert_response :success
    assert_select "li[id='#{@boy_2.id.to_s}']", count: 0
  end
end
