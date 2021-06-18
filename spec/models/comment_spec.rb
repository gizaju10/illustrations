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
    it 'user_idが空の場合' do
      comment = build(:comment, user_id: nil)
      expect(comment).not_to be_valid
    end

    it 'contentが空の場合' do
      comment = build(:comment, content: nil)
      comment.valid?
      expect(comment.errors[:content]).to include('空欄でのコメント投稿はできません。')
    end

    it 'contentが141文字の場合' do
      comment = build(:comment, content: 'a' * 141)
      comment.valid?
      expect(comment.errors).to be_added(:content, :too_long, count: 140)
    end
  end

  describe '各モデルとのアソシエーション' do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context 'Userモデルとのアソシエーション' do
      let(:target) { :user }

      it 'Userとの関連付けはbelongs_toであること' do
        expect(association.macro).to  eq :belongs_to
      end
    end

    context 'Postモデルとのアソシエーション' do
      let(:target) { :post }

      it 'Postとの関連付けはbelongs_toであること' do
        expect(association.macro).to  eq :belongs_to
      end
    end
    context 'Notificationsモデルとのアソシエーション' do
      let(:target) { :notifications }
      it 'Notificationとの関連付けはhas_manyであること' do
        expect(association.macro).to eq :has_many
      end
      it '結合するモデルのクラス：Notification' do
        expect(association.class_name).to eq 'Notification'
      end
      it 'Commentが削除されたらNotificationも削除されること' do
        notification = create(:notification, post_id: post.id, comment_id: 1, action: 'comment', visitor_id: 1,
                                             visited_id: 1)
        expect { comment.destroy }.to change(Notification, :count).by(0)
      end
    end
  end
end
