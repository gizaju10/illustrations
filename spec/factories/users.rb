FactoryBot.define do

  factory :user do
    name                  {Faker::Name.initials(number: 6)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    profile               {Faker::Lorem.sentence}
  end

end