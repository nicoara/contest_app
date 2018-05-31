require 'test_helper'

class DancersMostCompetitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @boy_most_competitions = create(:boy)
    @girl_most_competitions = create(:girl)
    @girl = create(:girl)
    boy_2 = create(:boy)
    couple = create(:couple, boy_id: @boy_most_competitions.id, girl_id: @girl_most_competitions.id)
    couple_2 = create(:couple, boy_id: @boy_most_competitions.id, girl_id: @girl.id)
    couple_3 = create(:couple, boy_id: boy_2.id, girl_id: @girl_most_competitions.id)
    competition = create(:competition)
    division = create(:division)
    age_section = create(:age_section)
    create(:entry, couple_id: couple.id, competition_id: competition.id,
                      division_id: division.id, age_section_id: age_section.id)
    create(:entry, couple_id: couple_2.id, competition_id: competition.id,
                      division_id: division.id, age_section_id: age_section.id)
    create(:entry, couple_id: couple_3.id, competition_id: competition.id,
                      division_id: division.id, age_section_id: age_section.id)
  end

  test "should show correct dancer with most competitions" do
    get dancers_most_competitions_url
    assert_response :success
    assert_select 'li', count: 2
    assert_select "li[id='#{@boy_most_competitions.id.to_s}']"
    assert_select "li[id='#{@girl_most_competitions.id.to_s}']"
  end

  test "should not show incorrect dancer with most competitions" do
    get dancers_most_competitions_url
    assert_response :success
    assert_select "li[id='#{@girl.id.to_s}']", count: 0
  end
end
