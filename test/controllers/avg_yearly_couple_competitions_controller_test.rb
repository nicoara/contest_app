require 'test_helper'

class AvgYearlyCoupleCompetitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @boy = create(:boy)
    @girl = create(:girl)
    girl_2 = create(:girl)
    @couple = create(:couple, boy_id: @boy.id, girl_id: girl_2.id)
    @couple_2 = create(:couple, boy_id: @boy.id, girl_id: @girl.id)

    competition = create(:competition)
    competition_2 = create(:competition)
    division = create(:division)
    age_section = create(:age_section)
    create(:entry, couple_id: @couple.id, competition_id: competition.id,
                      division_id: division.id, age_section_id: age_section.id)
    create(:entry, couple_id: @couple.id, competition_id: competition_2.id,
                      division_id: division.id, age_section_id: age_section.id,
                      created_at: 1.years.ago )
    create(:entry, couple_id: @couple_2.id, competition_id: competition.id,
                      division_id: division.id, age_section_id: age_section.id)
    create(:entry, couple_id: @couple_2.id, competition_id: competition_2.id,
                      division_id: division.id, age_section_id: age_section.id,
                      created_at: 4.years.ago )
  end

  test "should show correct avg yearly competitions" do
    get avg_yearly_couple_competitions_url
    assert_response :success
    assert_select 'li', count: 2
    avg_yearly_couple_1 = '%.4f' % (2/3.0)
    assert_select "li[id='"+@couple.id.to_s+"-"+avg_yearly_couple_1.to_s+"']"
    avg_yearly_couple_2 = '%.4f' % (1/3.0)
    assert_select "li[id='"+@couple_2.id.to_s+"-"+avg_yearly_couple_2.to_s+"']"
  end
end
