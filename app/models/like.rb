class Like < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  belongs_to :gossip
  validates :user, presence: true
end