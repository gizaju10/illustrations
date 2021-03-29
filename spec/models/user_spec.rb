require 'rails_helper'

RSpec.describe User, type: :model do
#   # pending "add some examples to (or delete) #{__FILE__}"
#   # it "名前とメールアドレスとパスワードがあれば登録できる" do 
#   #   expect(FactoryBot.create(:user)).to be_valid
#   # end 

#   it "名前がなければ登録できない" do 
#     expect(FactoryBot.build(:user, name: "")).to_not be_valid 
#   end 

#   it "メールアドレスがなければ登録できない" do 
#     expect(FactoryBot.build(:user, email: "")).to_not be_valid 
#   end 

#   # it "メールアドレスが重複していたら登録できない" do 
#   #   user1 = FactoryBot.create(:user,name: "taro", email: "taro@example.com")
#   #   expect(FactoryBot.build(:user, name: "ziro", email: user1.email)).to_not be_valid
#   # end 

#   it "パスワードがなければ登録できない" do 
#     expect(FactoryBot.build(:user, password: "")).to_not be_valid 
#   end 

#   # it "パスワードが暗号化されているか" do 
#   #   user = FactoryBot.create(:user)
#   #   expect(user.password_digest).to_not eq "password"
#   # end 

#   it "password_confirmationとpasswordが異なる場合保存できない" do 
#     expect(FactoryBot.build(:user,password:"password",password_confirmation: "passward")).to_not be_valid 
#   end 

  # describe User do
    # describe '#create' do
      # 入力されている場合のテスト ▼
  
      it "全ての項目の入力が存在すれば登録できること" do # テストしたいことの内容
        user = build(:user)  # 変数userにbuildメソッドを使用して、factory_botのダミーデータを代入
        expect(user).to be_valid # 変数userの情報で登録がされるかどうかのテストを実行
      end
    

    it "nameがない場合は登録できないこと" do # テストしたいことの内容
      user = build(:user, name: nil) # 変数userにbuildメソッドを使用して、factory_botのダミーデータを代入(今回の場合は意図的にnicknameの値をからに設定)
      user.valid? #バリデーションメソッドを使用して「バリデーションにより保存ができない状態であるか」をテスト
      expect(user.errors[:name]).to include("が入力されていません。") # errorsメソッドを使用して、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、.to include("が入力されていません。")でエラー文を記述(今回のRailsを日本語化しているのでエラー文も日本語)
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("が入力されていません。")
    end

    it "パスワードが6文字以上であれば登録できる" do
      password = Faker::Internet.password(min_length: 6, max_length: 6)
      user = build(:user, password: password, password_confirmation: password)
      expect(user).to be_valid
    end

    it "パスワードが5文字以下だと登録できない" do
      password = Faker::Internet.password(min_length: 5, max_length: 5)
      user = build(:user, password: password, password_confirmation: password)
      user.valid?
      # expect(user.errors[:password]).to include(I18n.t('errors.messages.too_short', count: 6))
      expect(user.errors).to be_added(:password, :too_short, count: 6) # countはなくても良いらしい
    end

    it "パスワードと確認が一致していないと登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      # expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません。")
      expect(user.errors).to be_added(:password_confirmation, :confirmation, attribute: "パスワード")
    end

    # it "登録済みのemailアドレスでは登録できない" do
    #   email = Faker::Internet.email
    #   user = create(:user, email: email)
    #   user2 = build(:user, email: email)
    #   user2.valid?
    #   expect(user2.errors[:email]).to include("は既に使用されています。")
    # end
  # end
end
