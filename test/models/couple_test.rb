require 'test_helper'

class CoupleTest < ActiveSupport::TestCase
  def setup
    @couple = Couple.new(boy: dancers(:Benedetto),
                        girl_id: dancers(:Claudia).id)
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

end
