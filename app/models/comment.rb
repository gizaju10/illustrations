class Comment < ApplicationRecord
  has_many :notifications, dependent: :destroy # コメントの通知

  belongs_to :user
  belongs_to :post

  validates :content, { presence: true, length: { maximum: 140 } }
end
