FactoryBot.define do
    factory :comment do
      content { Faker::Lorem.characters(number: 100) }
      # content { Faker::Lorem.sentence(number: 100) }
      association :user
      association :post
    end
  end