class DancerPartners

  def self.of(dancer_id)
    is_boy = Dancer.select('is_boy').find(dancer_id)
    partner_ids = is_boy ?
      Couple.where(boy_id: dancer_id).select(:girl_id) :
      Couple.where(girl_id: dancer_id).select(:boy_id)
    Dancer.where(id: partner_ids)
  end
end
