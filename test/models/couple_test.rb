require 'test_helper'

class CoupleTest < ActiveSupport::TestCase
  def setup
    @couple = create(:couple, boy_id: create(:boy).id,
                        girl_id: create(:girl).id)
  end

  test "should be valid" do
    assert @couple.valid?
  end

  test "should require a boy id" do
    @couple.boy_id = nil
    assert_not @couple.valid?
  end

  test "should require a girl id" do
    @couple.boy_id = nil
    assert_not @couple.valid?
  end

  test "boy and girl should be different" do
    @couple.boy_id = @couple.girl_id
    assert_not @couple.valid?
  end

  test "should not have the same couple twice" do
    @couple.save!

    @couple2 = Couple.new(boy: @couple.boy, girl: @couple.girl)
    assert_not @couple2.valid?
  end

end
