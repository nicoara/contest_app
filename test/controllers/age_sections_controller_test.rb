require 'test_helper'

class AgeSectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @age_section = create(:age_section)
  end

  test "should get index" do
    get age_sections_url
    assert_response :success
  end

  test "should get new" do
    get new_age_section_url
    assert_response :success
  end

  test "should create age_section" do
    assert_difference('AgeSection.count') do
      post age_sections_url, params: { age_section: { name: @age_section.name } }
    end

    assert_redirected_to age_section_url(AgeSection.last)
  end

  test "should show age_section" do
    get age_section_url(@age_section)
    assert_response :success
  end

  test "should get edit" do
    get edit_age_section_url(@age_section)
    assert_response :success
  end

  test "should update age_section" do
    patch age_section_url(@age_section), params: { age_section: { name: @age_section.name } }
    assert_redirected_to age_section_url(@age_section)
  end

  test "should destroy age_section" do
    assert_difference('AgeSection.count', -1) do
      delete age_section_url(@age_section)
    end

    assert_redirected_to age_sections_url
  end
end
