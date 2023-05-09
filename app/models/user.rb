class User < ApplicationRecord
  has_many :sent_private_messages, foreign_key: "sender_id"
  has_many :recipients
  has_many :received_private_messages, through: :recipients, source: :private_message, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end