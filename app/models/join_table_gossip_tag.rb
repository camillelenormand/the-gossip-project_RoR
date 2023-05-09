class JoinTableGossipTag < ApplicationRecord
  belongs_to :gossip
  belongs_to :tag
  validates :gossip, presence: true
end