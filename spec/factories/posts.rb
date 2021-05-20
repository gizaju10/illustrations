FactoryBot.define do
    factory :post do
      title {Faker::Name.initials(number: 10)}
      url { "https://www.youtube.com/watch?v=jNQXAC9IVRw" }
      category_list {["知識"]}
      occupation_list {["漫画家"]}
      target_list {["初心者"]}
      content {Faker::Name.initials(number: 90)}
      association :user
    end
  end