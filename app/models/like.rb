class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates_uniqueness_of :post_id, scope: :user_id # 追加 post_idとuser_id　の組が1組しかないようにバリデーションをかける
end
