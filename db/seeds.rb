array = %w(知識 技術 メンタル その他カテゴリー 漫画家 イラストレーター キャラクターデザイナー コンセプトアーティスト アニメーター 絵本作家 その他職種 初心者 中級者 上級者 小学生以下 中学・高校生 専門・大学生 社会人)
array.each{ |tag|
  tag_list = ActsAsTaggableOn::Tag.new
  tag_list.name = tag
  tag_list.save
}

User.create(name: ENV['TEST_USER_NAME'], email: ENV['TEST_USER'], password: ENV['TEST_USER_PASSWORD'], password_confirmation: ENV['TEST_USER_PASSWORD'], confirmed_at: Time.now, profile: "テストユーザーです。")
User.create(name: ENV['ADMINISTRATOR_USER_NAME'], email: ENV['ADMINISTRATOR_USER'], password: ENV['ADMINISTRATOR_USER_PASSWORD'], password_confirmation: ENV['ADMINISTRATOR_USER_PASSWORD'], confirmed_at: Time.now, profile: "よろしくお願いします。")