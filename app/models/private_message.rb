class PrivateMessage < ApplicationRecord
  has_many :recipients
  has_many :users, through: :recipients
  belongs_to :sender, class_name: "User"
  validates :content, presence: true
end