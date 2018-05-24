require 'test_helper'

class DancerTest < ActiveSupport::TestCase
  def setup
    @dancer = create(:dancer, name: "Claudia Koehler", country: "Germany")
  end

  test "name should be present" do
    @dancer.name = nil
    assert_not @dancer.valid?
  end

  test "country should be present"  do
    @dancer.country = "   "
    assert_not @dancer.valid?
  end

  test "name should not be too long" do
    @dancer.name = "a" * 51
    assert_not @dancer.valid?
  end

  test "country should not be too long" do
    @dancer.country = "a" * 51
    assert_not @dancer.valid?
  end
end
