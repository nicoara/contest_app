require 'test_helper'

class DancerSlowestDivisionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @boy_slowest_journey = create(:boy)
    boy_2 = create(:boy)
    @girl_slowest_journey = create(:girl)
    @girl_2 = create(:girl)
    girl_3 = create(:girl)
    @couple_1 = create(:couple, boy_id: @boy_slowest_journey.id, girl_id: @girl_slowest_journey.id)
    @couple_2 = create(:couple, boy_id: @boy_slowest_journey.id, girl_id: @girl_2.id)
    @couple_3 = create(:couple, boy_id: boy_2.id, girl_id: @girl_slowest_journey.id)
    @couple_4 = create(:couple, boy_id: boy_2.id, girl_id: girl_3.id)

    @competition = create(:competition)
    @division_weaker = create(:division, ranking: 1)
    @division_stronger = create(:division, ranking: 3)
    @age_section = create(:age_section)

  end

  test "should show correct slowest dancers through divisions " do
    one_year_ago = 1.year.ago
    create(:entry, couple_id: @couple_1.id, competition_id: @competition.id,
                      division_id: @division_stronger.id, age_section_id: @age_section.id)
    create(:entry, couple_id: @couple_2.id, competition_id: @competition.id,
                      division_id: @division_weaker.id, age_section_id: @age_section.id,
                      created_at: one_year_ago)
    create(:entry, couple_id: @couple_3.id, competition_id: @competition.id,
                      division_id: @division_weaker.id, age_section_id: @age_section.id,
                      created_at: one_year_ago)
    create(:entry, couple_id: @couple_4.id, competition_id: @competition.id,
                      division_id: @division_stronger.id, age_section_id: @age_section.id,
                      created_at: 4.years.ago) #testing for negative evolution for boy_2

    get dancer_slowest_divisions_url
    assert_response :success
    assert_select 'li', count: 2
    assert_select "li[id='"+@boy_slowest_journey.id.to_s+"']"
    assert_select "li[id='"+@girl_slowest_journey.id.to_s+"']"
  end

  test "should show correct dancer when all dancers in only one competition" do
    create(:entry, couple_id: @couple_1.id, competition_id: @competition.id,
                      division_id: @division_stronger.id, age_section_id: @age_section.id)
    create(:entry, couple_id: @couple_2.id, competition_id: @competition.id,
                      division_id: @division_stronger.id, age_section_id: @age_section.id)

    get dancer_slowest_divisions_url
    assert_response :success
    assert_select 'li', count: 3
    assert_select "li[id='"+@boy_slowest_journey.id.to_s+"']"
    assert_select "li[id='"+@girl_slowest_journey.id.to_s+"']"
    assert_select "li[id='"+@girl_2.id.to_s+"']"
  end
end
