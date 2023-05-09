class Comment < ApplicationRecord
  belongs_to :parent, polymorphic: true
  belongs_to :author, class_name: "User"
  belongs_to :gossip
  has_many :likes, dependent: :destroy
  validates :content, presence: true
end