# coding: utf-8

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
Post.create("user_id"=>"1", "title"=>"目の描き方がわかる！", "url"=>"https://www.youtube.com/watch?v=XimUk5_O0mY", "category_list"=>["知識", "技術"], "occupation_list"=>["漫画家", "イラストレーター", "キャラクターデザイナー", "アニメーター"], "target_list"=>["初心者", "小学生以下", "中学・高校生", "専門・大学生", "社会人"], "content"=>"マンガなどのデフォルメされた目の描き方が学べる動画です。\r\n\r\n可愛い目が描きたい超初心者向けの内容となっています。")
Post.create("user_id"=>"1", "title"=>"線画が苦手な全ての方へ", "url"=>"https://www.youtube.com/watch?v=_J0ai2N1z9E", "category_list"=>["知識", "技術"], "occupation_list"=>["漫画家", "イラストレーター", "キャラクターデザイナー", "アニメーター"], "target_list"=>["中級者", "中学・高校生", "専門・大学生", "社会人"], "content"=>"線画を描くの嫌いだったのですが、この動画で線画のコツが分かりました。\r\n\r\n線画の苦手意識がある方に観てほしいです！")
Comment.create(content: "凄く為になりました！", user_id: 2, post_id: 2)
Like.create(post_id: 1, user_id: 5)
Like.create(post_id: 2, user_id: 7)
Like.create(post_id: 2, user_id: 2)
Like.create(post_id: 2, user_id: 4)
Relationship.create(follower_id: 1, following_id: 10)
Relationship.create(follower_id: 1, following_id: 9)
Relationship.create(follower_id: 2, following_id: 5)
Relationship.create(follower_id: 3, following_id: 1)
Relationship.create(follower_id: 2, following_id: 1)
Relationship.create(follower_id: 3, following_id: 8)
Relationship.create(follower_id: 8, following_id: 3)
Relationship.create(follower_id: 9, following_id: 8)