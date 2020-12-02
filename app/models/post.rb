class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy # 追加 コメント 削除も仮追加
  has_many :likes, dependent: :destroy # 追加 もしpostがデータベースから削除されてしまった場合、likesも削除
  has_many :liked_users, through: :likes, source: :user # 追加 いいね機能の利用


  # 記事検索
  # def self.search(search)
  #   self.where(['title LIKE ? OR url LIKE ? OR category_1 LIKE ? OR category_2 LIKE ? OR category_3 LIKE ? OR category_4 LIKE ? OR job_1 LIKE ? OR job_2 LIKE ? OR job_3 LIKE ? OR job_4 LIKE ? OR job_5 LIKE ? OR job_6 LIKE ? OR job_7 LIKE ? OR job_8 LIKE ? OR target_1 LIKE ? OR target_2 LIKE ? OR target_3 LIKE ? OR target_4 LIKE ? OR target_5 LIKE ? OR target_6 LIKE ? OR target_7 LIKE ? OR content LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
  # end

  def self.search(search)
    self.where(['content LIKE ?', "%#{search}%"])
  end
end