class Post < ApplicationRecord

  acts_as_taggable_on :tags

  validates:title, {presence: true, length: {maximum: 255}} # 未入力NG, 最大文字数を255文字
  VALID_YOUTUBE_URL = /(\Ahttps:\/\/www\.youtube\.com\/watch\?v=)+[\w]{11}/
  validates:url, {presence: true, format: {with: VALID_YOUTUBE_URL}, length: {maximum: 120}} # 未入力NG, YouTubeのURL以外NG, 最大文字数を120文字
  validates:content, {presence: true, length: {maximum: 300}} # 未入力NG, 最大文字数を300文字

  belongs_to :user
  has_many :comments, dependent: :destroy # 追加 コメント 削除も仮追加
  has_many :likes, dependent: :destroy # 追加 もしpostがデータベースから削除されてしまった場合、likesも削除
  has_many :liked_users, through: :likes, source: :user # 追加 いいね機能の利用


  # 記事検索
  def self.search(search)
    self.where(['content LIKE ?', "%#{search}%"])
  end
end