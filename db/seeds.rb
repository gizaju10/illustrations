array = %w(知識 技術 メンタル その他カテゴリー 漫画家 イラストレーター キャラクターデザイナー コンセプトアーティスト アニメーター 絵本作家 その他職種 初心者 中級者 上級者 小学生以下 中学・高校生 専門・大学生 社会人)
array.each{ |tag|
  tag_list = ActsAsTaggableOn::Tag.new
  tag_list.name = tag
  tag_list.save
}

User.create!(
  [
    {
      email: ENV['TEST_USER'],
      name: ENV['TEST_USER_NAME'],
      password: ENV['TEST_USER_PASSWORD'],
      password_confirmation: ENV['TEST_USER_PASSWORD'],
      confirmed_at: Time.now,
      profile: "テストユーザーです。",
      # image: File.open('./app/assets/images/test.jpg')
    },
    {
      email: ENV['ADMINISTRATOR_USER'],
      name: ENV['ADMINISTRATOR_USER_NAME'],
      password: ENV['ADMINISTRATOR_USER_PASSWORD'],
      password_confirmation: ENV['ADMINISTRATOR_USER_PASSWORD'],
      confirmed_at: Time.now,
      profile: "よろしくお願いします。"
      # image: File.open('./app/assets/images/test.jpg')
    },
    {
      email: "test1@test.com",
      name: "ゴン",
      password: ENV['TEST_ETC_PASSWORD'],
      password_confirmation: ENV['TEST_ETC_PASSWORD'],
      confirmed_at: Time.now,
      profile: "よろしくお願いします。",
      # image: File.open('./app/assets/images/test.jpg')
    },
    {
      email: "test2@test.com",
      name: "キルア",
      password: ENV['TEST_ETC_PASSWORD'],
      password_confirmation: ENV['TEST_ETC_PASSWORD'],
      confirmed_at: Time.now,
      profile: "よろしくお願いします。"
      # image: File.open('./app/assets/images/test.jpg')
    },
    {
      email: "test3@test.com",
      name: "クラピカ",
      password: ENV['TEST_ETC_PASSWORD'],
      password_confirmation: ENV['TEST_ETC_PASSWORD'],
      confirmed_at: Time.now,
      profile: "よろしくお願いします。"
      # image: File.open('./app/assets/images/test.jpg')
    },
    {
      email: "test4@test.com",
      name: "レオリオ",
      password: ENV['TEST_ETC_PASSWORD'],
      password_confirmation: ENV['TEST_ETC_PASSWORD'],
      confirmed_at: Time.now,
      profile: "よろしくお願いします。"
      # image: File.open('./app/assets/images/test.jpg')
    },
    {
      email: "test5@test.com",
      name: "浦飯幽助",
      password: ENV['TEST_ETC_PASSWORD'],
      password_confirmation: ENV['TEST_ETC_PASSWORD'],
      confirmed_at: Time.now,
      profile: "よろしくお願いします。"
      # image: File.open('./app/assets/images/test.jpg')
    },
    {
      email: "test6@test.com",
      name: "桑原和馬",
      password: ENV['TEST_ETC_PASSWORD'],
      password_confirmation: ENV['TEST_ETC_PASSWORD'],
      confirmed_at: Time.now,
      profile: "よろしくお願いします。"
      # image: File.open('./app/assets/images/test.jpg')
    },
    {
      email: "test7@test.com",
      name: "蔵馬",
      password: ENV['TEST_ETC_PASSWORD'],
      password_confirmation: ENV['TEST_ETC_PASSWORD'],
      confirmed_at: Time.now,
      profile: "よろしくお願いします。"
      # image: File.open('./app/assets/images/test.jpg')
    },
    {
      email: "test8@test.com",
      name: "飛影",
      password: ENV['TEST_ETC_PASSWORD'],
      password_confirmation: ENV['TEST_ETC_PASSWORD'],
      confirmed_at: Time.now,
      profile: "よろしくお願いします。"
      # image: File.open('./app/assets/images/test.jpg')
    },
  ]
)

# User.create(name: ENV['TEST_USER_NAME'], email: ENV['TEST_USER'], password: ENV['TEST_USER_PASSWORD'], password_confirmation: ENV['TEST_USER_PASSWORD'], confirmed_at: Time.now, profile: "テストユーザーです。")
# User.create(name: ENV['ADMINISTRATOR_USER_NAME'], email: ENV['ADMINISTRATOR_USER'], password: ENV['ADMINISTRATOR_USER_PASSWORD'], password_confirmation: ENV['ADMINISTRATOR_USER_PASSWORD'], confirmed_at: Time.now, profile: "よろしくお願いします。")
# User.create(name: ENV['ADMINISTRATOR_USER_NAME'], email: ENV['ADMINISTRATOR_USER'], password: ENV['ADMINISTRATOR_USER_PASSWORD'], password_confirmation: ENV['ADMINISTRATOR_USER_PASSWORD'], confirmed_at: Time.now, profile: "よろしくお願いします。")
# User.create(name: ENV['ADMINISTRATOR_USER_NAME'], email: ENV['ADMINISTRATOR_USER'], password: ENV['ADMINISTRATOR_USER_PASSWORD'], password_confirmation: ENV['ADMINISTRATOR_USER_PASSWORD'], confirmed_at: Time.now, profile: "よろしくお願いします。")
# User.create(name: ENV['ADMINISTRATOR_USER_NAME'], email: ENV['ADMINISTRATOR_USER'], password: ENV['ADMINISTRATOR_USER_PASSWORD'], password_confirmation: ENV['ADMINISTRATOR_USER_PASSWORD'], confirmed_at: Time.now, profile: "よろしくお願いします。")
# User.create(name: ENV['ADMINISTRATOR_USER_NAME'], email: ENV['ADMINISTRATOR_USER'], password: ENV['ADMINISTRATOR_USER_PASSWORD'], password_confirmation: ENV['ADMINISTRATOR_USER_PASSWORD'], confirmed_at: Time.now, profile: "よろしくお願いします。")
# User.create(name: ENV['ADMINISTRATOR_USER_NAME'], email: ENV['ADMINISTRATOR_USER'], password: ENV['ADMINISTRATOR_USER_PASSWORD'], password_confirmation: ENV['ADMINISTRATOR_USER_PASSWORD'], confirmed_at: Time.now, profile: "よろしくお願いします。")
# User.create(name: ENV['ADMINISTRATOR_USER_NAME'], email: ENV['ADMINISTRATOR_USER'], password: ENV['ADMINISTRATOR_USER_PASSWORD'], password_confirmation: ENV['ADMINISTRATOR_USER_PASSWORD'], confirmed_at: Time.now, profile: "よろしくお願いします。")
# User.create(name: ENV['ADMINISTRATOR_USER_NAME'], email: ENV['ADMINISTRATOR_USER'], password: ENV['ADMINISTRATOR_USER_PASSWORD'], password_confirmation: ENV['ADMINISTRATOR_USER_PASSWORD'], confirmed_at: Time.now, profile: "よろしくお願いします。")
# User.create(name: ENV['ADMINISTRATOR_USER_NAME'], email: ENV['ADMINISTRATOR_USER'], password: ENV['ADMINISTRATOR_USER_PASSWORD'], password_confirmation: ENV['ADMINISTRATOR_USER_PASSWORD'], confirmed_at: Time.now, profile: "よろしくお願いします。")
# User.create(name: ENV['ADMINISTRATOR_USER_NAME'], email: ENV['ADMINISTRATOR_USER'], password: ENV['ADMINISTRATOR_USER_PASSWORD'], password_confirmation: ENV['ADMINISTRATOR_USER_PASSWORD'], confirmed_at: Time.now, profile: "よろしくお願いします。")
# User.create(name: ENV['ADMINISTRATOR_USER_NAME'], email: ENV['ADMINISTRATOR_USER'], password: ENV['ADMINISTRATOR_USER_PASSWORD'], password_confirmation: ENV['ADMINISTRATOR_USER_PASSWORD'], confirmed_at: Time.now, profile: "よろしくお願いします。")
# User.create(name: ENV['ADMINISTRATOR_USER_NAME'], email: ENV['ADMINISTRATOR_USER'], password: ENV['ADMINISTRATOR_USER_PASSWORD'], password_confirmation: ENV['ADMINISTRATOR_USER_PASSWORD'], confirmed_at: Time.now, profile: "よろしくお願いします。")
# User.create(name: ENV['ADMINISTRATOR_USER_NAME'], email: ENV['ADMINISTRATOR_USER'], password: ENV['ADMINISTRATOR_USER_PASSWORD'], password_confirmation: ENV['ADMINISTRATOR_USER_PASSWORD'], confirmed_at: Time.now, profile: "よろしくお願いします。")
# User.create(name: ENV['ADMINISTRATOR_USER_NAME'], email: ENV['ADMINISTRATOR_USER'], password: ENV['ADMINISTRATOR_USER_PASSWORD'], password_confirmation: ENV['ADMINISTRATOR_USER_PASSWORD'], confirmed_at: Time.now, profile: "よろしくお願いします。")
# User.create(name: ENV['ADMINISTRATOR_USER_NAME'], email: ENV['ADMINISTRATOR_USER'], password: ENV['ADMINISTRATOR_USER_PASSWORD'], password_confirmation: ENV['ADMINISTRATOR_USER_PASSWORD'], confirmed_at: Time.now, profile: "よろしくお願いします。")
# User.create(name: ENV['ADMINISTRATOR_USER_NAME'], email: ENV['ADMINISTRATOR_USER'], password: ENV['ADMINISTRATOR_USER_PASSWORD'], password_confirmation: ENV['ADMINISTRATOR_USER_PASSWORD'], confirmed_at: Time.now, profile: "よろしくお願いします。")
# User.create(name: ENV['ADMINISTRATOR_USER_NAME'], email: ENV['ADMINISTRATOR_USER'], password: ENV['ADMINISTRATOR_USER_PASSWORD'], password_confirmation: ENV['ADMINISTRATOR_USER_PASSWORD'], confirmed_at: Time.now, profile: "よろしくお願いします。")