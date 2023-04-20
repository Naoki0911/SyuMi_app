class Sake < ApplicationRecord
  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
  belongs_to :user
has_one_attached :image

  def self.ransackable_attributes(auth_object = nil)
    %w[name place]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[sake]
  end
end
