require 'rails_helper'

RSpec.describe Like, type: :model do
  let!(:user) { create(:user) }
  # let!(:post) { build(:post, user: user) }

  describe '正常値と異常値の確認' do
    context 'likeモデルのバリデーション' do
      it "user_idとpost_idがあれば保存できる" do
        # expect(FactoryBot.build_stubbed(:like)).to be_valid
        expect(FactoryBot.create(:like)).to be_valid
      end

      it "user_idがなければ無効な状態であること" do
        like = build(:like, user_id: nil)
        # like.valid?
        # expect(like.errors[:user_id]).to include("を入力してください")
        expect(like).not_to be_valid
      end

      it "post_idがなければ無効な状態であること" do
        like = build(:like, post_id: nil)
        # like.valid?
        # expect(like.errors[:post_id]).to include("を入力してください")
        expect(like).not_to be_valid
      end

      it "post_idが同じでもuser_idが違うと保存できる" do
        like = create(:like)
        expect(FactoryBot.create(:like, post_id: like.post_id)).to be_valid
      end

      it "user_idが同じでもpost_idが違うと保存できる" do
        like = create(:like)
        expect(FactoryBot.create(:like, user_id: like.user_id)).to be_valid
      end

      it "post_idとuser_idは一意でなければ保存できない" do
        like = create(:like)
        like2 = build(:like, post_id: like.post_id, user_id: like.user_id)
        like2.valid?
        expect(like2.errors[:post_id]).to include("はすでに存在します")
      end
    end
  end

  describe "各モデルとのアソシエーション" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "Userモデルとのアソシエーション" do
      let(:target) { :user }

      it "Userとの関連付けはbelongs_toであること" do
        expect(association.macro).to  eq :belongs_to
      end
    end

    context "Tweetモデルとのアソシエーション" do
      let(:target) { :post }

      it "Tweetとの関連付けはbelongs_toであること" do
        expect(association.macro).to  eq :belongs_to
      end
    end
  end
end