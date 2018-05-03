class Dancer < ApplicationRecord
  has_many :boys, class_name: "Couple", foreign_key: "boy_id12"
  has_many :girls, class_name: "Couple", foreign_key: "girl_id"

  validates :name,  presence: true, length: { maximum: 50 }
  validates :country,  presence: true, length: { maximum: 50 }
end
