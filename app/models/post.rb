class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy # 追加 コメント 削除も仮追加
  has_many :likes # 追加
  has_many :liked_users, through: :likes, source: :user # 追加 いいね機能の利用
end
