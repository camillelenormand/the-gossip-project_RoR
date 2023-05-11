class Tag < ApplicationRecord
  has_many :JoinTableGossipsTags
  has_many :gossips, through: :JoinTableGossipsTag, class_name: "Gossip"
  validates :title, presence: true
end