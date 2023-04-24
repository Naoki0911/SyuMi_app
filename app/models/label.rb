class Label < ApplicationRecord
  has_many :labelings, dependent: :destroy
  has_many :sakes, through: :labelings, source: :sake

end
