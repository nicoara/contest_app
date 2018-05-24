require 'test_helper'

class CompetitionMostEarningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    boy_germany = create(:boy, name: 'Jurgen Klopp', country: 'Germany')
    girl_germany = create(:girl, name: 'Angela Merkel', country: 'Germany')
    couple_germany = create(:couple, boy_id: boy_germany.id, girl_id: girl_germany.id)

    @competition_cheap = create(:competition, price: 100)
    @competition_expensive = create(:competition, price: 200)
    division = create(:division)
    age_section = create(:age_section)
    entry = create(:entry, couple_id: couple_germany.id, competition_id: @competition_cheap.id,
                      division_id: division.id, age_section_id: age_section.id)
    entry_2 = create(:entry, couple_id: couple_germany.id, competition_id: @competition_expensive.id,
                      division_id: division.id, age_section_id: age_section.id)
  end

  test "should show correct competition with most earnings" do
    get competition_most_earnings_url
    assert_response :success
    text = "Competition id: #{@competition_expensive.id}"
    assert_select 'p', text: text, count: 1
  end

  test "should not show incorrect competition with most earnings" do
    get competition_most_earnings_url
    assert_response :success
    text = "Competition id: #{@competition_cheap.id}"
    assert_select 'p', text: text, count: 0
  end
end
