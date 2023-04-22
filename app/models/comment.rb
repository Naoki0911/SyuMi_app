class Comment < ApplicationRecord
  belongs_to :sake
  belongs_to :user

  validates :reply, presence: true
end
