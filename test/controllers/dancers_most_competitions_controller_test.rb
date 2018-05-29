require 'test_helper'

class DancersMostCompetitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @boy_germany = create(:boy, name: 'Jurgen Klopp', country: 'Germany')
    @girl_germany = create(:girl, name: 'Angela Merkel', country: 'Germany')
    girl_italy = create(:girl, name: 'Alessandra Elati', country: 'Italy')
    couple_diff_country = create(:couple, boy_id: @boy_germany.id, girl_id: girl_italy.id)
    couple_same_country = create(:couple, boy_id: @boy_germany.id, girl_id: @girl_germany.id)

    competition = create(:competition)
    division = create(:division)
    age_section = create(:age_section)
    entry = create(:entry, couple_id: couple_diff_country.id, competition_id: competition.id,
                      division_id: division.id, age_section_id: age_section.id)
    entry_2 = create(:entry, couple_id: couple_same_country.id, competition_id: competition.id,
                      division_id: division.id, age_section_id: age_section.id)
  end

  test "should show correct dancer with most competitions" do
    get dancers_most_competitions_url
    assert_response :success
    text = "id: #{@boy_germany.id}"
    assert_select 'p', text: text, count: 1
  end

  test "should not show incorrect dancer with most competitions" do
    get dancers_most_competitions_url
    assert_response :success
    text = "id: #{@girl_germany.id}"
    assert_select 'p', text: text , count: 0
  end
end
