class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy # 追加 もしユーザーがデータベースから削除されてしまった場合にユーザーがした投稿も全て消える
  has_many :comments # 追加 コメント
  has_many :likes, dependent: :destroy # 追加
  has_many :liked_posts, through: :likes, source: :post # 追加 いいね機能の利用

  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy # 追加 フォローできるユーザーを取り出す
  has_many :followings, through: :following_relationships # 追加 フォローしているユーザーを取り出す

  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy # 追加 フォローされているユーザーを取り出す

  has_many :followers, through: :follower_relationships # 追加 フォローされているユーザーを取り出す

  # いいねしているかどうかの判定
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
  
  # フォローする関数
  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  # フォローしているか調べるための関数
  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  # フォローを外す関数
  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end
end