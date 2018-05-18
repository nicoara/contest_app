class Entry < ApplicationRecord
  belongs_to :couple
  belongs_to :competition
  belongs_to :division
  belongs_to :age_section

  validates :couple_id,  presence: true
  validates :competition_id,  presence: true
  validates :division_id, presence: true
  validates :age_section_id, presence: true
  validates :couple_id, uniqueness: { scope: :competition_id}
end
