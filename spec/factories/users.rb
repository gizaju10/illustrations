# FactoryBot.define do 
#   factory :user do #factory :testuser, class: User do のようにクラスを明示すればモデル名以外のデータも作れます。
#     name { "test" }
#     sequence(:email) { |n| "TEST#{n}@example.com" }
#     password { "testuser" }
#   end
# end

FactoryBot.define do

  factory :user do
    # name                  {"テストユーザー"}
    sequence(:name) { |n| "name" }
    # email                 {"abcde@gmail.com"}
    sequence(:email)      { |n| "TEST#{n}@example.com" }
    password              {"aaaaaa"}
    password_confirmation {"aaaaaa"}
    profile               {"初めまして。"}
    # profile_photo { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/image/main_top.jpg")) }
  end

  factory :takashi, class: User do
    name                  {"Takashi"}
    email                 {"takashi@example.com"}
    password              {"aaaaaa"}
    password_confirmation {"aaaaaa"}
    profile               {"初め"}
  end

  factory :satoshi, class: User do
    name                  {"Satoshi"}
    email                 {"satoshi@example.com"}
    password              {"aaaaaa"}
    password_confirmation {"aaaaaa"}
    profile               {"初"}
  end
end