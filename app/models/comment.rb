class Comment < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :gossip
  has_many :likes, dependent: :destroy

  validates :content, presence: true, length: { minimum: 5, maximum: 1000 }
end