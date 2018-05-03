require 'test_helper'

class DivisionTest < ActiveSupport::TestCase
  def setup
    @division = Division.new(name: "adult")
  end

  test "name should be present" do
    @division.name = nil
    assert_not @division.valid?
  end

  test "name should not be too long" do
    @division.name = "a" * 51
    assert_not @division.valid?
  end

end
