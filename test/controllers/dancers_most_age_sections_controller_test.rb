require 'test_helper'

class DancersMostAgeSectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @boy_most_age_sections = create(:boy)
    boy_2 = create(:boy)
    @girl_most_age_sections = create(:girl)
    @girl_2 = create(:girl)
    couple = create(:couple, boy_id: @boy_most_age_sections.id, girl_id: @girl_2.id)
    couple_2 = create(:couple, boy_id: @boy_most_age_sections.id, girl_id: @girl_most_age_sections.id)
    couple_3 = create(:couple, boy_id: boy_2.id, girl_id: @girl_most_age_sections.id)

    competition = create(:competition)
    division = create(:division)
    age_section = create(:age_section)
    age_section_2 = create(:age_section)
    create(:entry, couple_id: couple.id, competition_id: competition.id,
                      division_id: division.id, age_section_id: age_section.id)
    create(:entry, couple_id: couple_2.id, competition_id: competition.id,
                      division_id: division.id, age_section_id: age_section_2.id)
    create(:entry, couple_id: couple_3.id, competition_id: competition.id,
                      division_id: division.id, age_section_id: age_section.id)
  end

  test "should show correct dancer with most age sections" do
    get dancers_most_age_sections_url
    assert_response :success
    assert_select 'li', count: 2
    assert_select "li[id='"+@boy_most_age_sections.id.to_s+"']"
    assert_select "li[id='"+@girl_most_age_sections.id.to_s+"']"
  end

  test "should not show incorrect dancer with most age sections" do
    get dancers_most_age_sections_url
    assert_response :success
    assert_select "li[id='"+@girl_2.id.to_s+"']", count: 0
  end
end
