class Entry < ApplicationRecord
  belongs_to :couple
  belongs_to :competition
  belongs_to :division
  belongs_to :agesection

  validates :couple_id,  presence: true
  validates :competition_id,  presence: true
  validates :division_id, presence: true
  validates :agesection_id, presence: true
end
