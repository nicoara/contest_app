require 'test_helper'

class CountryMostCouplesCompetitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @boy_germany = create(:boy, name: 'Jurgen Klopp', country: 'Germany')
    @girl_germany = create(:girl, name: 'Angela Merkel', country: 'Germany')
    girl_italy = create(:girl, name: 'Alessandra Elati', country: 'Italy')
    couple_diff_country = create(:couple, boy_id: @boy_germany.id, girl_id: girl_italy.id)
    couple_germany = create(:couple, boy_id: @boy_germany.id, girl_id: @girl_germany.id)

    competition = create(:competition)
    division = create(:division)
    age_section = create(:age_section)
    entry = create(:entry, couple_id: couple_diff_country.id, competition_id: competition.id,
                      division_id: division.id, age_section_id: age_section.id,
                      created_at: 1.years.ago )
    entry_2 = create(:entry, couple_id: couple_germany.id, competition_id: competition.id,
                      division_id: division.id, age_section_id: age_section.id)
  end

  test "should show correct country with most couples at competitions" do
    get country_most_couples_competitions_url
    assert_response :success
    text = "Country: Germany"
    assert_select 'p', text: text, count: 1
  end

  test "should not show incorrect country with most couples at competitions" do
    get country_most_couples_competitions_url
    assert_response :success
    text = "Country: Italy"
    assert_select 'p', text: text, count: 0
  end
end
