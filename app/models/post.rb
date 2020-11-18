class Post < ApplicationRecord
  belongs_to :user
  has_many :comments # 追加 コメント
  has_many :likes # 追加
  has_many :liked_users, through: :likes, source: :user # 追加 いいね機能の利用
end
