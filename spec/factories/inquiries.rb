FactoryBot.define do
    factory :inquiry do
      # user
      # room
      # association :user
      # association :room
      # user_id   { user.id }
      # room_id   { room.id }
    #   user_id { FactoryBot.create(:user).id }
    #   room_id { FactoryBot.create(:room).id }
      name { Faker::Lorem.word }
      email {"abcde@gmail.com"}
      message { Faker::Lorem.word }
    end
  end