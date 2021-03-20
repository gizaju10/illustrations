# FactoryBot.define do 
#   factory :user do #factory :testuser, class: User do のようにクラスを明示すればモデル名以外のデータも作れます。
#     name { "test" }
#     sequence(:email) { |n| "TEST#{n}@example.com" }
#     password { "testuser" }
#   end
# end

FactoryBot.define do

  factory :user do
    name                  {"テストユーザー"}
    email                 {"abcde@gmail.com"}
    password              {"aaaaaa"}
    password_confirmation {"aaaaaa"}
    profile               {"初めまして。"}
  end
end