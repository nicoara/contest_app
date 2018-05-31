require 'test_helper'

class DancerPartnersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @boy = create(:boy, name: 'Jurgen Klopp')
    @boy_2 = create(:boy)
    @girl = create(:girl)
    @girl_2 = create(:girl)
    create(:couple, boy_id: @boy.id, girl_id: @girl.id)
    create(:couple, boy_id: @boy_2.id, girl_id: @girl.id)
    create(:couple, boy_id: @boy.id, girl_id: @girl_2.id)
  end

  test "should show partners for a girl" do
    get dancer_partner_url(@girl.id)
    assert_select 'li', count: 2
    assert_select "li[id='#{@boy.id.to_s}']"
    assert_select "li[id='#{@boy_2.id.to_s}']"
  end

  test "should show partners for a boy" do
    get dancer_partner_url(@boy.id)
    assert_select 'li', count: 2
    assert_select "li[id='#{@girl.id.to_s}']"
    assert_select "li[id='#{@girl_2.id.to_s}']"
  end
end
