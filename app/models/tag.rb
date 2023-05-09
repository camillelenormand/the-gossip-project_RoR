class Tag < ApplicationRecord
  has_many :JoinTableGossipsTags, dependent: :destroy
  validates :title, presence: true, length: { in: 3..14 }
end