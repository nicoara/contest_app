class Couple < ApplicationRecord
  belongs_to :boy, class_name: "Dancer"
  belongs_to :girl, class_name: "Dancer"

  has_many :entries

  validates :boy_id,  presence: true
  validates :girl_id,  presence: true
  validate  :different_dancers
  validates :girl_id, uniqueness: { scope: :boy_id}

  private

    def different_dancers
      if boy_id == girl_id
        errors.add(:pair, "should have different dancers on same pair")
      end
    end

end
