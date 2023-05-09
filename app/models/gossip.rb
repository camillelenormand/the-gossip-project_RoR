class Gossip < ApplicationRecord
  belongs_to :user
  has_many :JoinTableGossipsTags, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :title, presence: true
end