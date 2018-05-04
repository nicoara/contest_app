class Division < ApplicationRecord
  has_many :entries

  validates :name,  presence: true, length: { maximum: 50 }
end
