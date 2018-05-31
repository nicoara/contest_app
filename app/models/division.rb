# Class that shows the division in which a dancer activates
# name examples: Professional, General
class Division < ApplicationRecord
  has_many :entries

  validates :name,  presence: true, length: { maximum: 50 }
  validates :ranking,  uniqueness: true
end
