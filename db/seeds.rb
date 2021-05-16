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
      profile: "テストユーザーです。\r\n\r\nポートフォリオ閲覧用の為、一部機能は使用できないようにしています。",
      image: File.open("./db/fixtures/test_user.jpg")
    },
    {
      email: ENV['ADMINISTRATOR_USER'],
      name: ENV['ADMINISTRATOR_USER_NAME'],
      password: ENV['ADMINISTRATOR_USER_PASSWORD'],
      password_confirmation: ENV['ADMINISTRATOR_USER_PASSWORD'],
      confirmed_at: Time.now,
      profile: "よろしくお願いします。"
    },
    {
      email: "test1@test.com",
      name: "ラム",
      password: ENV['TEST_ETC_PASSWORD'],
      password_confirmation: ENV['TEST_ETC_PASSWORD'],
      confirmed_at: Time.now,
      profile: "絵を描くことが好きです。\nみなさんよろしく！",
      image: File.open("./db/fixtures/test1.jpg")
    },
    {
      email: "test2@test.com",
      name: "球磨川",
      password: ENV['TEST_ETC_PASSWORD'],
      password_confirmation: ENV['TEST_ETC_PASSWORD'],
      confirmed_at: Time.now,
      profile: "趣味で漫画を描いています。\nよろしくお願いします。"
    },
    {
      email: "test3@test.com",
      name: "クラピカ",
      password: ENV['TEST_ETC_PASSWORD'],
      password_confirmation: ENV['TEST_ETC_PASSWORD'],
      confirmed_at: Time.now,
      profile: "イラスト初心者です。",
      image: File.open("./db/fixtures/test3.jpg")
    },
    {
      email: "test4@test.com",
      name: "乱馬",
      password: ENV['TEST_ETC_PASSWORD'],
      password_confirmation: ENV['TEST_ETC_PASSWORD'],
      confirmed_at: Time.now,
      profile: "絵を楽しんで描いています。",
      image: File.open("./db/fixtures/test4.png")
    },
    {
      email: "test5@test.com",
      name: "浦飯幽助",
      password: ENV['TEST_ETC_PASSWORD'],
      password_confirmation: ENV['TEST_ETC_PASSWORD'],
      confirmed_at: Time.now,
      profile: "初心者ですが、初心者でも分かりやすい動画を紹介していきたいです。",
    },
    {
      email: "test6@test.com",
      name: "まどか",
      password: ENV['TEST_ETC_PASSWORD'],
      password_confirmation: ENV['TEST_ETC_PASSWORD'],
      confirmed_at: Time.now,
      profile: "このサイトで独学の絵の勉強を始めました。\r\n\r\n沢山投稿していきたいです。",
      image: File.open("./db/fixtures/test6.png")
    }
  ]
)

Post.create("user_id"=>"1", "title"=>"目の描き方がわかる！", "url"=>"https://www.youtube.com/watch?v=XimUk5_O0mY", "category_list"=>["知識", "技術"], "occupation_list"=>["漫画家", "イラストレーター", "キャラクターデザイナー", "アニメーター"], "target_list"=>["初心者", "小学生以下", "中学・高校生", "専門・大学生", "社会人"], "content"=>"マンガなどのデフォルメされた目の描き方が学べる動画です。\r\n\r\n可愛い目が描きたい超初心者向けの内容となっています。")
Post.create("user_id"=>"1", "title"=>"線画が苦手な全ての方へ", "url"=>"https://www.youtube.com/watch?v=_J0ai2N1z9E", "category_list"=>["知識", "技術"], "occupation_list"=>["漫画家", "イラストレーター", "キャラクターデザイナー", "アニメーター"], "target_list"=>["中級者", "中学・高校生", "専門・大学生", "社会人"], "content"=>"線画を描くの嫌いだったのですが、この動画で線画のコツが分かりました。\r\n\r\n線画の苦手意識がある方に観てほしいです！")
Post.create("user_id"=>"1", "title"=>"男女の描き分け方法が分かる", "url"=>"https://www.youtube.com/watch?v=cXKh8VaMBdc", "category_list"=>["知識", "技術"], "occupation_list"=>["イラストレーター", "キャラクターデザイナー", "アニメーター", "絵本作家"], "target_list"=>["初心者", "小学生以下", "中学・高校生", "専門・大学生", "社会人"], "content"=>"男女の描き方の違いが分かって描くときに参考になる動画です。")
Comment.create(content: "凄く為になりました！", user_id: 2, post_id: 2)
Like.create(post_id: 1, user_id: 5)
Like.create(post_id: 2, user_id: 2)
Like.create(post_id: 2, user_id: 4)
Like.create(post_id: 2, user_id: 7)
Like.create(post_id: 3, user_id: 4)
Relationship.create(follower_id: 1, following_id: 7)
Relationship.create(follower_id: 1, following_id: 8)
Relationship.create(follower_id: 2, following_id: 1)
Relationship.create(follower_id: 2, following_id: 5)
Relationship.create(follower_id: 3, following_id: 1)
Relationship.create(follower_id: 3, following_id: 8)
Relationship.create(follower_id: 8, following_id: 3)
Relationship.create(follower_id: 8, following_id: 7)