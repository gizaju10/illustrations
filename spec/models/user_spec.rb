require 'rails_helper'

RSpec.describe User, type: :model do
  context 'ユーザーを登録できる' do
    it "ユーザー情報が全て入力されている場合" do
      user = build(:user) 
      expect(user).to be_valid
    end

    it "nameが8文字以下である場合" do
      name = Faker::Name.initials(number: 8)
      user = build(:user, name: name)
      expect(user).to be_valid
    end
    
    it "passwordが6文字以上である場合" do
      password = Faker::Internet.password(min_length: 6, max_length: 6)
      user = build(:user, password: password, password_confirmation: password)
      expect(user).to be_valid
    end

    it "パスワードが暗号化されているか" do 
      user = build(:user)
      expect(user.password).to_not eq "password"
    end
  end
  
  context 'ユーザーを登録できない' do
    it "nameが空の場合" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("が入力されていません。")
    end

    it "nameが9文字以上の場合" do
      name = Faker::Name.initials(number: 9)
      user = build(:user, name: name)
      user.valid?
      expect(user.errors).to be_added(:name, :too_long, count: 8)
    end

    it "emailが空の場合" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end

    it "passwordが空の場合" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("が入力されていません。")
    end

    it "passwordが5文字以下の場合" do
      password = Faker::Internet.password(min_length: 5, max_length: 5)
      user = build(:user, password: password, password_confirmation: password)
      user.valid?
      # expect(user.errors[:password]).to include(I18n.t('errors.messages.too_short', count: 6))
      expect(user.errors).to be_added(:password, :too_short, count: 6) # countはなくても良いらしい
    end

    it "パスワードと確認が一致していない場合" do
      user = build(:user, password_confirmation: "")
      user.valid?
      # expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません。")
      expect(user.errors).to be_added(:password_confirmation, :confirmation, attribute: "パスワード")
    end
    
    it "メールアドレスが重複している場合" do 
      user1 = create(:user,name: "taro", email: "taro@example.com")
      expect(build(:user, name: "ziro", email: user1.email)).to_not be_valid
    end

    it "登録済みのemailアドレスがある場合" do
      # email = Faker::Internet.email
      user = create(:user, email: "aaa@mail.com")
      user2 = build(:user, email: "aaa@mail.com")
      user2.valid?
      expect(user2.errors[:email]).to include("は既に使用されています。")
    end
  end


  describe 'アソシエーション' do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context 'Postモデルとの関係' do
      let(:target) { :posts }
      it '1:多' do
        expect(association.macro).to eq :has_many
      end
      it '結合するモデルのクラス名：Post' do
        expect(association.class_name).to eq 'Post'
      end
    end

    context 'Likeモデルとの関係' do
      let(:target) { :likes }
      it '1:多' do
        expect(association.macro).to eq :has_many
      end
      it '結合するモデルのクラス名：Like' do
        expect(association.class_name).to eq 'Like'
      end
    end

    context 'Commentモデルとの関係' do
      let(:target) { :comments }
      it '1:多' do
        expect(association.macro).to eq :has_many
      end
      it '結合するモデルのクラス名：Like' do
        expect(association.class_name).to eq 'Comment'
      end
    end

    context 'FollowRelationship（following_relationships）モデルとの関係' do
      let(:target) { :following_relationships }
      it '1:多' do
        expect(association.macro).to eq :has_many
      end
      it '結合するモデルのクラス：Relationship' do
        expect(association.class_name).to eq 'Relationship'
      end
    end

    context 'FollowRelationship（follower_relationships）モデルとの関係' do
      let(:target) { :follower_relationships }
      it '1:多' do
        expect(association.macro).to eq :has_many
      end
      it '結合するモデルのクラス：Relationship' do
        expect(association.class_name).to eq 'Relationship'
      end
    end

    context 'SnsCredentialモデルとの関係' do
      let(:target) { :sns_credentials }
      it '1:1' do
        expect(association.macro).to eq :has_many
      end
      it '結合するモデルのクラス：SnsCredential' do
        expect(association.class_name).to eq 'SnsCredential'
      end
    end
  end
end