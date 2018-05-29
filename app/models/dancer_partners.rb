class DancerPartners

  def self.of(dancer_id)
    is_boy = Dancer.find(dancer_id).is_boy
    partner_ids = is_boy ?
      Couple.where(boy_id: dancer_id).select(:girl_id) :
      Couple.where(girl_id: dancer_id).select(:boy_id)
    Dancer.where(id: partner_ids)
  end
end
