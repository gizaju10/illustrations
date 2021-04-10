FactoryBot.define do

  factory :user do
    # name                  {"テストユーザー"}
    # name                  { Faker::Name.last_name }
    name                  {Faker::Name.initials(number: 6)}
    # sequence(:name) { |n| "name" }
    # email                 {"abcde@gmail.com"}
    email                 {Faker::Internet.free_email}
    # sequence(:email)      { |n| "TEST#{n}@example.com" }
    # password              {"aaaaaa"}
    password              {Faker::Internet.password(min_length: 6)}
    # password_confirmation {"aaaaaa"}
    password_confirmation {password}
    # profile               {"初めまして。"}
    profile               {Faker::Lorem.sentence}
    # profile_photo { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/image/main_top.jpg")) }
    # image {""}
  end

end