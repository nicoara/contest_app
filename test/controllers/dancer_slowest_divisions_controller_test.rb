require 'test_helper'

class DancerSlowestDivisionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @boy_slowest_journey = create(:boy)
    boy_2 = create(:boy)
    @girl_slowest_journey = create(:girl)
    girl_2 = create(:girl)
    couple = create(:couple, boy_id: @boy_slowest_journey.id, girl_id: @girl_slowest_journey.id)
    couple_2 = create(:couple, boy_id: boy_2.id, girl_id: girl_2.id)

    competition = create(:competition)
    competition_2 = create(:competition)
    division_weaker = create(:division, ranking: 1)
    division_stronger = create(:division, ranking: 3)
    age_section = create(:age_section)

    create(:entry, couple_id: couple.id, competition_id: competition_2.id,
                      division_id: division_stronger.id, age_section_id: age_section.id)
    create(:entry, couple_id: couple.id, competition_id: competition.id,
                      division_id: division_weaker.id, age_section_id: age_section.id,
                      created_at: 1.year.ago)

    create(:entry, couple_id: couple_2.id, competition_id: competition_2.id,
                      division_id: division_stronger.id, age_section_id: age_section.id)
    create(:entry, couple_id: couple_2.id, competition_id: competition.id,
                      division_id: division_weaker.id, age_section_id: age_section.id,
                      created_at: 1.day.ago)
  end

  test "should show correct slowest dancers through divisions " do
    get dancer_slowest_divisions_url
    assert_response :success
    assert_select 'li', count: 2
    assert_select "li[id='"+@boy_slowest_journey.id.to_s+"']"
    assert_select "li[id='"+@girl_slowest_journey.id.to_s+"']"
  end
end
