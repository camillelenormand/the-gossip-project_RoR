class User < ApplicationRecord
  has_secure_password
  has_many :sent_private_messages, foreign_key: "sender_id"
  has_many :recipients
  has_many :received_private_messages, through: :recipients, source: :private_message, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  
  belongs_to :city, required: false
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Email address invalid" }
  validates_uniqueness_of :email, :case_sensitive => false
  validates :password, presence: true, length: { minimum: 6 }
end