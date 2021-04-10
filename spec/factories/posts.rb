FactoryBot.define do
    factory :post do
      # title { "動画" }
      title {Faker::Name.initials(number: 10)}
      url { "https://www.youtube.com/watch?v=jNQXAC9IVRw" }
      # category_list {["技術", "メンタル", "その他カテゴリー"]}
      category_list {["知識"]}
      # occupation_list {["イラストレーター", "キャラクターデザイナー", "コンセプトアーティスト"]}
      occupation_list {["漫画家"]}
      # target_list {["初心者", "中級者", "中学・高校生"]}
      target_list {["初心者"]}
      # content { "YouTube最初の投稿です。" }
      content {Faker::Name.initials(number: 90)}
      association :user
      # association :category
    end
  end