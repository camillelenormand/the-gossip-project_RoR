class City < ApplicationRecord
  has_many :users
  validates :name, presence: true
  has_many :gossips, through: :users 
end