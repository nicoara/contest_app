require 'test_helper'

class CountryMostCouplesCompetitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @boy_germany = create(:boy, country: 'Germany')
    girl_germany = create(:girl, country: 'Germany')
    @boy_italy = create(:boy, country: 'Italy')
    girl_italy = create(:girl, country: 'Italy')
    @boy_romania = create(:boy, country: 'Romania')
    couple = create(:couple, boy_id: @boy_romania.id, girl_id: girl_italy.id)
    couple_2 = create(:couple, boy_id: @boy_germany.id, girl_id: girl_germany.id)
    couple_3 = create(:couple, boy_id: @boy_italy.id, girl_id: girl_italy.id)

    competition = create(:competition)
    division = create(:division)
    age_section = create(:age_section)
    create(:entry, couple_id: couple.id, competition_id: competition.id,
                      division_id: division.id, age_section_id: age_section.id,
                      created_at: 1.years.ago)
    create(:entry, couple_id: couple_2.id, competition_id: competition.id,
                      division_id: division.id, age_section_id: age_section.id)
    create(:entry, couple_id: couple_3.id, competition_id: competition.id,
                      division_id: division.id, age_section_id: age_section.id)
  end

  test "should show correct country with most couples at competitions" do
    get country_most_couples_competitions_url
    assert_response :success
    assert_select 'li', count: 2
    assert_select "li[id='"+@boy_germany.country.to_s+"']"
    assert_select "li[id='"+@boy_italy.country.to_s+"']"
  end

  test "should not show incorrect country with most couples at competitions" do
    get country_most_couples_competitions_url
    assert_response :success
    assert_select "li[id='"+@boy_romania.country.to_s+"']", count: 0
  end
end
