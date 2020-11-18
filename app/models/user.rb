class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy # 追加 もしユーザーがデータベースから削除されてしまった場合にユーザーがした投稿も全て消える
  has_many :comments # 追加 コメント
  has_many :likes, dependent: :destroy # 追加
  has_many :liked_posts, through: :likes, source: :post # 追加 いいね機能の利用

  # いいねしているかどうかの判定
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end
