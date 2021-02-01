require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  # it "名前とメールアドレスとパスワードがあれば登録できる" do 
  #   expect(FactoryBot.create(:user)).to be_valid
  # end 

  it "名前がなければ登録できない" do 
    expect(FactoryBot.build(:user, name: "")).to_not be_valid 
  end 

  it "メールアドレスがなければ登録できない" do 
    expect(FactoryBot.build(:user, email: "")).to_not be_valid 
  end 

  # it "メールアドレスが重複していたら登録できない" do 
  #   user1 = FactoryBot.create(:user,name: "taro", email: "taro@example.com")
  #   expect(FactoryBot.build(:user, name: "ziro", email: user1.email)).to_not be_valid
  # end 

  it "パスワードがなければ登録できない" do 
    expect(FactoryBot.build(:user, password: "")).to_not be_valid 
  end 

  # it "パスワードが暗号化されているか" do 
  #   user = FactoryBot.create(:user)
  #   expect(user.password_digest).to_not eq "password"
  # end 

  it "password_confirmationとpasswordが異なる場合保存できない" do 
    expect(FactoryBot.build(:user,password:"password",password_confirmation: "passward")).to_not be_valid 
  end 
end
