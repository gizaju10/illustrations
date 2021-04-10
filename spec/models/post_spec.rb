require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:user) { create(:user) }
  # let!(:post) { create(:post) }

  context '投稿を保存できる' do
    let!(:post) { build(:post, user: user) }
    it '投稿内容が全て入力されている場合' do
      expect(post).to be_valid
    end
  end

  context '投稿を保存できない' do
    it 'titleが空の場合' do
      post = build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include("タイトルの入力は必須です。")
    end

    it 'titleが25文字以上の場合' do
      title = SecureRandom.alphanumeric(25)
      post = build(:post, title: title)
      post.valid?
      # expect(post.errors[:title]).to be_valid
      # expect(post.errors[:title]).to include("タイトルの入力は必須です。")
      expect(post.errors).to be_added(:title, :too_long, count: 24)
    end

    it 'urlが空の場合' do
      post = build(:post, url: nil)
      post.valid?
      expect(post.errors[:url]).to include("入力は必須です。", "紹介したいYouTube動画のURLを入力して下さい。 ※投稿できない動画もあります。")
    end

    it 'urlが121文字以上の場合' do
      title = SecureRandom.alphanumeric(121)
      post = build(:post, title: title)
      post.valid?
      expect(post.errors).to be_added(:title, :too_long, count: 24)
    end

    it 'contentが空の場合' do
      post = build(:post, content: nil)
      post.valid?
      expect(post.errors[:content]).to include("紹介文の入力は必須です。")
    end

    it 'contentが301文字以上の場合' do
      content = SecureRandom.alphanumeric(301)
      post = build(:post, content: content)
      post.valid?
      expect(post.errors).to be_added(:content, :too_long, count: 300)
    end

    it 'category_listが空の場合' do
      post = build(:post, category_list: nil)
      post.valid?
      expect(post.errors[:category_list]).to include("カテゴリーの選択は必須です。 ※複数選択可")
    end

    it 'occupation_listが空の場合' do
      post = build(:post, occupation_list: nil)
      post.valid?
      expect(post.errors[:occupation_list]).to include("対象職種の選択は必須です。 ※複数選択可")
    end

    it 'target_listが空の場合' do
      post = build(:post, target_list: nil)
      post.valid?
      expect(post.errors[:target_list]).to include("対象者の選択は必須です。 ※複数選択可")
    end


    describe "#search" do
      # 各テストの前にPostを作成
      before do
        user = create(:user)
        @post = create(
          :post,
          title: "天気が良い",
          content: "今日は快晴です",
        )
  
        @other_post = create(
          :post,
          title: "天気が悪い",
          content: "今日は雨です",
        )
      end
  
      context "「晴」で検索した場合、曖昧検索できているか" do
        it "@postを返すこと" do
          expect(Post.search("晴")).to include(@post)
        end
  
        it "@other_postを返さないこと" do
          expect(Post.search("晴")).to_not include(@other_post)
        end
      end
  
      context "「快晴」で検索した場合、一致検索できているか" do
        it "@postを返すこと" do
          expect(Post.search("快晴")).to include(@post)
        end
  
        it "@other_postを返さないこと" do
          expect(Post.search("快晴")).to_not include(@other_post)
        end
      end
  
      context "検索に一致しないものは表示されないこと" do
        it "「曇り」で検索した場合、0件であること" do
          expect(Post.search("曇り")).to be_empty
        end
      end
    end
  
    describe "各モデルとのアソシエーション" do
      let(:association) do
        described_class.reflect_on_association(target)
      end
      let(:post) { create(:post) }
  
      context "Likeモデルとのアソシエーション" do
        let(:target) { :likes }
        it "Likeとの関連付けはhas_manyであること" do
          expect(association.macro).to eq :has_many
        end
  
        it "Postが削除されたらLikeも削除されること" do
          like = create(:like, post_id: post.id)
          expect { post.destroy }.to change(Like, :count).by(-1)
        end
      end
  
      context "Commentsモデルとのアソシエーション" do
        let(:target) { :comments }
        it "Commentとの関連付けはhas_manyであること" do
          expect(association.macro).to eq :has_many
        end
  
        it "Postが削除されたらCommentも削除されること" do
          comment = create(:comment, post_id: post.id, user_id: user.id)
          expect { post.destroy }.to change(Comment, :count).by(-1)
        end
      end
  
      # context "Notificationsモデルとのアソシエーション" do
      #   let(:target) { :notifications }
      #   it "Notificationとの関連付けはhas_manyであること" do
      #     expect(association.macro).to eq :has_many
      #   end
  
      #   it "Postが削除されたらNotificationも削除されること" do
      #     notification = create(:notification, post_id: post.id, visitor_id: 1, visited_id: 1)
      #     expect { post.destroy }.to change(Notification, :count).by(-1)
      #   end
      # end
    end







  end
end
