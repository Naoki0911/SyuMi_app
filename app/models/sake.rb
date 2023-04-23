class Sake < ApplicationRecord
  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :content, presence: true
  validates :place, presence: true
  validates :sweetness, presence: true, inclusion: { in: 0..5 }
  validates :flavor, presence: true, inclusion: { in: 0..5 }
  validates :sour, presence: true, inclusion: { in: 0..5 }
  validates :feeling, presence: true, inclusion: { in: 0..5 }
  validates :rich, presence: true, inclusion: { in: 0..5 }

  def self.ransackable_attributes(auth_object = nil)
    %w[name place]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[sake]
  end
end
