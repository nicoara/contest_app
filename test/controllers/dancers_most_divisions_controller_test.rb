require 'test_helper'

class DancersMostDivisionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @boy = create(:boy)
    @girl = create(:girl)
    girl_2 = create(:girl)
    couple = create(:couple, boy_id: @boy.id, girl_id: girl_2.id)
    couple_2 = create(:couple, boy_id: @boy.id, girl_id: @girl.id)

    competition = create(:competition)
    division = create(:division, ranking: 1)
    division_2 = create(:division, ranking: 2)
    age_section = create(:age_section)
    entry = create(:entry, couple_id: couple.id, competition_id: competition.id,
                      division_id: division.id, age_section_id: age_section.id)
    entry_2 = create(:entry, couple_id: couple_2.id, competition_id: competition.id,
                      division_id: division_2.id, age_section_id: age_section.id)
  end

  test "should show correct dancer with most divisions" do
    get dancers_most_divisions_url
    assert_response :success
    text = "id: #{@boy.id}"
    assert_select 'p', text: text, count: 1
  end

  test "should not show incorrect dancer with most divisions" do
    get dancers_most_divisions_url
    assert_response :success
    text = "id: #{@girl.id}"
    assert_select 'p', text: text , count: 0
  end
end
