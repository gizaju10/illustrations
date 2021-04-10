# require 'rails_helper'

# RSpec.describe 'コメント投稿', type: :system do
#   before do
#     @user = create(:user)
#     @post = create(:post)
#     @comment = build(:comment)
#   end

#   # ログインしていないユーザーは、コメント投稿フォームが表示されないことを確認済み

#   it 'ログインしたユーザーはツイート詳細ページでコメントを投稿できる' do
#     # ログインする
#     @user.confirm
#     sign_in(@user)
#     # sign_in(@post.user)
#     # ツイート詳細ページに遷移する
#     visit post_path(@post)
#     # フォームに情報を入力する
#     fill_in 'comment_content', with: @comment.content
#     # コメントを送信すると、Commentモデルのカウントが1上がる
#     expect  do
#       # find('input[name="commit"]').click
#       # find('コメントする').click
#       click_on('コメントする')
#       sleep 5
#     end.to change {Comment.count}.by(1)
#     # コメント内容と「あなたのコメントです」と表示されている
#     # visit post_path(@post)
#     # expect(page).to have_content(@comment.text)
#     # expect(page).to have_content('あなた')
#   end
# end


# # @user = create(:user)
# # @post = create(:post)
# # @comment = build(:comment)
# # end

# # # ログインしていないユーザーは、コメント投稿フォームが表示されないことを確認済み

# # it 'ログインしたユーザーはツイート詳細ページでコメントを投稿できる' do
# # # ログインする
# # @user.confirm
# # sign_in(@user)