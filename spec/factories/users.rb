FactoryBot.define do

  factory :user do
    name                  {Faker::Name.initials(number: 6)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    profile               {Faker::Lorem.sentence}
    # profile_photo { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/image/main_top.jpg")) }
    # image {""}
  end

end