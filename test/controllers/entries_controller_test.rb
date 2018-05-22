require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    boy = create(:boy)
    girl = create(:girl)
    couple = create(:couple, boy_id: boy.id, girl_id: girl.id)
    competition = create(:competition)
    division = create(:division)
    age_section = create(:age_section)
    @entry = create(:entry, couple_id: couple.id, competition_id: competition.id,
                      division_id: division.id, age_section_id: age_section.id)
  end

  test "should get index" do
    get entries_url
    assert_response :success
  end

  test "should get new" do
    get new_entry_url
    assert_response :success
  end

  test "should create entry" do
    competition_2 = create(:competition, name: 'test_competition')
    assert_difference('Entry.count') do
      post entries_url, params: { entry:
        { age_section_id: @entry.age_section_id,
          competition_id: competition_2.id,
          couple_id: @entry.couple_id,
          division_id: @entry.division_id
        } }
    end

    assert_redirected_to entry_url(Entry.last)
  end

  test "should show entry" do
    get entry_url(@entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_entry_url(@entry)
    assert_response :success
  end

  test "should update entry" do
    patch entry_url(@entry), params: { entry: { age_section_id: @entry.age_section_id, competition_id: @entry.competition_id, couple_id: @entry.couple_id, division_id: @entry.division_id } }
    assert_redirected_to entry_url(@entry)
  end

  test "should destroy entry" do
    assert_difference('Entry.count', -1) do
      delete entry_url(@entry)
    end

    assert_redirected_to entries_url
  end
end
