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

  before_save { self.email = email.downcase }
  before_update :set_full_name
  before_create :set_full_name
  before_create :get_username

  private
  def set_full_name
    if self.first_name.nil? && self.last_name.nil?
      self.full_name = self.email.split('@')[0].capitalize
    else 
      self.full_name = self.first_name.capitalize + " " + self.last_name.capitalize
    end
  end

  def get_username
    if self.username.nil? || self.username.length < 1
    self.username = self.email.split('@')[0].lowercase
    end
  end
end