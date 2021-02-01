class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: [:google_oauth2]
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :profile, length: { maximum: 200 }

  # validates :password, presence: true
  # validates :email, presence: true 
  # validates :email, uniqueness: true

  has_many :sns_credentials, dependent: :destroy
  has_many :posts, dependent: :destroy # 追加 もしユーザーがデータベースから削除されてしまった場合にユーザーがした投稿も全て消える
  has_many :comments, dependent: :destroy # 追加 コメント 削除も仮追加
  has_many :likes, dependent: :destroy # 追加
  has_many :liked_posts, through: :likes, source: :post # 追加 いいね機能の利用

  has_many :following_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # 追加 フォローできるユーザーを取り出す
  has_many :followings, through: :following_relationships # 追加 フォローしているユーザーを取り出す

  has_many :follower_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy # 追加 フォローされているユーザーを取り出す

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

  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  def self.without_sns_data(auth)
    user = User.where(email: auth.info.email).first

      if user.present?
        sns = SnsCredential.create(
          uid: auth.uid,
          provider: auth.provider,
          user_id: user.id
        )
      else
        user = User.new(
          name: auth.info.name,
          email: auth.info.email,
        )
        sns = SnsCredential.new(
          uid: auth.uid,
          provider: auth.provider
        )
      end
      return { user: user ,sns: sns}
    end

   def self.with_sns_data(auth, snscredential)
    user = User.where(id: snscredential.user_id).first
    unless user.present?
      user = User.new(
        name: auth.info.name,
        email: auth.info.email,
      )
    end
    return {user: user}
   end

   def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = with_sns_data(auth, snscredential)[:user]
      sns = snscredential
    else
      user = without_sns_data(auth)[:user]
      sns = without_sns_data(auth)[:sns]
    end
    return { user: user ,sns: sns}
  end

end