class User < ApplicationRecord
  validates :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: [:google_oauth2]
  mount_uploader :image, ImageUploader
  validates :profile, length: { maximum: 200 }
  has_many :sns_credentials, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post # いいね機能の利用
  has_many :following_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォローできるユーザーを取り出す
  has_many :followings, through: :following_relationships # フォローしているユーザーを取り出す
  has_many :follower_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy # フォローされているユーザーを取り出す
  has_many :followers, through: :follower_relationships # フォローされているユーザーを取り出す

  # いいねしているかどうか
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
  
  # フォローしているか調べる
  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  # フォローする
  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  # フォローを外す
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