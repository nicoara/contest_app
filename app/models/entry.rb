class Entry < ApplicationRecord
  belongs_to :couple #, class_name: "Couple"
  # belongs_to :competition, class_name: "Competition"
  # belongs_to :division, class_name: "Division"
  # belongs_to :agesection, class_name: "Agesection"

  validates :couple_id,  presence: true
  validates :competition_id,  presence: true
  validates :division_id, presence: true
  validates :agesection_id, presence: true
end
