require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user) { create(:user) }
  let!(:post) { build(:post, user: user) }
  let!(:comment) { build(:comment, user: user, post: post) }
  context 'コメントを投稿できる' do
    
    it 'commentが入力されている場合' do
      expect(comment).to be_valid
    end
  end

  context 'コメントを投稿できない' do  
      it "user_idが空の場合" do
        comment = build(:comment, user_id: nil)
        expect(comment).not_to be_valid
      end
  
      it "contentが空の場合" do
        comment = build(:comment, content: nil)
        comment.valid?
        expect(comment.errors[:content]).to include("空欄でのコメント投稿はできません。")
      end
  
      it "contentが141文字の場合" do
        comment = build(:comment, content: "a" * 141)
        comment.valid?
        expect(comment.errors).to be_added(:content, :too_long, count: 140)
      end
  end
end

# describe "各モデルとのアソシエーション" do
#   let(:association) do
#     described_class.reflect_on_association(target)
#   end

#   # context "Notificationモデルとのアソシエーション" do
#   #   let(:target) { :notifications }

#   #   it "Notificationとの関連付けはhas_manyであること" do
#   #     expect(association.macro).to eq :has_many
#   #   end

#     it "Commentが削除されたらNotificationも削除されること" do
#       comment = create(:comment)
#       # notification = create(:notification, comment_id: comment.id, visitor_id: 1, visited_id: 1)
#       notification = create(:notification, comment_id: comment.id)
#       expect { comment.destroy }.to change(Comment, :count).by(-1)
#     end
#   end
# end
# end