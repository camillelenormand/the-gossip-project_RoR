class Recipient < ApplicationRecord
  belongs_to :user
  belongs_to :private_message
  validates :user, presence: true
end