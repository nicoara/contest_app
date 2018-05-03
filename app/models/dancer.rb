class Dancer < ApplicationRecord
  has_many :couples

  validates :name,  presence: true, length: { maximum: 50 }
  validates :country,  presence: true, length: { maximum: 50 }
end
