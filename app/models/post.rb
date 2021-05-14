class Post < ApplicationRecord

  acts_as_taggable_on :categories, :occupations, :targets
  # acts_as_taggable

  validates:title, {presence: true, length: {maximum: 100}} # 未入力NG, 最大文字数制限あり
  VALID_YOUTUBE_URL = /(\Ahttps:\/\/www\.youtube\.com\/watch\?v=)+[\w]{11}/
  validates:url, {presence: true, format: {with: VALID_YOUTUBE_URL}, length: {maximum: 120}} # 未入力NG, YouTubeのURL以外NG, 最大文字数を120文字
  validates:content, {presence: true, length: {maximum: 300}} # 未入力NG, 最大文字数を300文字
  validates:category_list, {presence: true}
  validates:occupation_list, {presence: true}
  validates:target_list, {presence: true}

  belongs_to :user
  has_many :comments, dependent: :destroy # 追加 コメント 削除も仮追加
  has_many :likes, dependent: :destroy # 追加 もしpostがデータベースから削除されてしまった場合、likesも削除
  has_many :liked_users, through: :likes, source: :user # 追加 いいね機能の利用

  has_many :notifications, dependent: :destroy # いいねの通知

  # 記事検索
  def self.search(search)
    self.joins(:user).where(['title LIKE ? OR content LIKE ? OR users.name LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
  end

  # いいね通知
  def create_notification_like!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        post_id: id,
        visited_id: user_id,
        action: 'like'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  # コメント通知
  def create_notification_comment!(current_user, comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    # temp_ids = Comment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
    temp_ids = Comment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
    save_notification_comment!(current_user, comment_id, user_id) # 投稿者への通知
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    # save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      post_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end



end