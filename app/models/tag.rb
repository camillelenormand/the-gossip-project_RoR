class Tag < ApplicationRecord
  has_many :JoinTableGossipsTags, dependent: :destroy
end