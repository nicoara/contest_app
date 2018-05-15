require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    boy = create(:dancer, is_boy: true)
    girl = create(:dancer, is_boy: false)
    couple = create(:couple, boy_id: boy.id, girl_id: girl.id)
    competition = create(:competition)
    division = create(:division)
    agesection = create(:agesection)
    @entry = create(:entry, couple_id: couple.id, competition_id: competition.id,
                      division_id: division.id, agesection_id: agesection.id)
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
    competition2 = create(:competition, name: 'test_competition')
    assert_difference('Entry.count') do
      post entries_url, params: { entry:
        { agesection_id: @entry.agesection_id,
          competition_id: competition2.id,
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
    patch entry_url(@entry), params: { entry: { agesection_id: @entry.agesection_id, competition_id: @entry.competition_id, couple_id: @entry.couple_id, division_id: @entry.division_id } }
    assert_redirected_to entry_url(@entry)
  end

  test "should destroy entry" do
    assert_difference('Entry.count', -1) do
      delete entry_url(@entry)
    end

    assert_redirected_to entries_url
  end
end
