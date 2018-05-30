require 'test_helper'

class CompetitionsMostEarningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    boy = create(:boy)
    girl = create(:girl)
    couple = create(:couple, boy_id: boy.id, girl_id: girl.id)

    @competition_cheap = create(:competition, price: 100)
    @competition_expensive = create(:competition, price: 200)
    @competition_expensive_2 = create(:competition, price: 200)
    division = create(:division)
    age_section = create(:age_section)
    create(:entry, couple_id: couple.id, competition_id: @competition_cheap.id,
                      division_id: division.id, age_section_id: age_section.id)
    create(:entry, couple_id: couple.id, competition_id: @competition_expensive.id,
                      division_id: division.id, age_section_id: age_section.id)
    create(:entry, couple_id: couple.id, competition_id: @competition_expensive_2.id,
                      division_id: division.id, age_section_id: age_section.id)
  end

  test "should show correct competition with most earnings" do
    get competitions_most_earnings_url
    assert_response :success
    assert_select 'li', count: 2
    assert_select "li[id='"+@competition_expensive.id.to_s+"']"
    assert_select "li[id='"+@competition_expensive_2.id.to_s+"']"
  end

  test "should not show incorrect competition with most earnings" do
    get competitions_most_earnings_url
    assert_response :success
    assert_select "li[id='"+@competition_cheap.id.to_s+"']", count: 0
  end
end
