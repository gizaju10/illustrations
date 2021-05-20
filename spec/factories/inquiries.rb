FactoryBot.define do
    factory :inquiry do
      name { Faker::Name.initials(number: 6)}
      email {"abcde@gmail.com"}
      message { Faker::Lorem.word }
    end
  end