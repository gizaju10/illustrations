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

Post.create("user_id"=>"7", "title"=>"目の描き方がわかる！", "url"=>"https://www.youtube.com/watch?v=XimUk5_O0mY", "category_list"=>["知識", "技術"], "occupation_list"=>["漫画家", "イラストレーター", "キャラクターデザイナー", "アニメーター"], "target_list"=>["初心者", "小学生以下", "中学・高校生", "専門・大学生", "社会人"], "content"=>"マンガなどのデフォルメされた目の描き方が学べる動画です。\r\n\r\n可愛い目が描きたい超初心者向けの内容となっています。")
Post.create("user_id"=>"1", "title"=>"線画が苦手な全ての方へ", "url"=>"https://www.youtube.com/watch?v=_J0ai2N1z9E", "category_list"=>["知識", "技術"], "occupation_list"=>["漫画家", "イラストレーター", "キャラクターデザイナー", "アニメーター"], "target_list"=>["中級者", "中学・高校生", "専門・大学生", "社会人"], "content"=>"線画を描くことが嫌いだったのですが、この動画で線画のコツが分かりました。\r\n\r\n線画の苦手意識がある方に観てほしいです！")
Post.create("user_id"=>"7", "title"=>"男女の描き分け方法が分かる", "url"=>"https://www.youtube.com/watch?v=cXKh8VaMBdc", "category_list"=>["知識", "技術"], "occupation_list"=>["イラストレーター", "キャラクターデザイナー", "アニメーター", "絵本作家"], "target_list"=>["初心者", "小学生以下", "中学・高校生", "専門・大学生", "社会人"], "content"=>"男女の描き方の違いが分かって描くときに参考になる動画です。")
Post.create("user_id"=>"8", "title"=>"【初心者向け】体の描き方！覚えるのは３つだけ！【プロ漫画家イラスト漫画教室】", "url"=>"https://www.youtube.com/watch?v=A3fmnPufAyA", "category_list"=>["知識", "技術"], "occupation_list"=>["漫画家", "イラストレーター", "キャラクターデザイナー", "アニメーター", "絵本作家"], "target_list"=>["初心者", "小学生以下", "中学・高校生", "専門・大学生", "社会人"], "content"=>"凄く分かりやすく初心者向けに体の描き方が解説されています。\r\n\r\n基礎中の基礎の話なので、骨格や筋肉については端折られています。")
Post.create("user_id"=>"2", "title"=>"キャラクターを引き立てる！背景イラストの描き方", "url"=>"https://www.youtube.com/watch?v=GWLvdIsHNRg", "category_list"=>["知識", "技術"], "occupation_list"=>["漫画家", "イラストレーター", "キャラクターデザイナー", "コンセプトアーティスト", "アニメーター", "絵本作家"], "target_list"=>["中級者", "中学・高校生", "専門・大学生", "社会人"], "content"=>"アナログでしかイラストを描いたことがなかったので、デジタルで描くことに抵抗がありましたが、デジタルの便利さに気付かされる動画でした。\r\n\r\n私のようにデジタルでイラストを描くことに抵抗がある方向けの動画です。")
Post.create("user_id"=>"3", "title"=>"【油絵】「画家が本気で猫描いてみた」が凄いッ!!!", "url"=>"https://www.youtube.com/watch?v=hBaIcKXeeEA", "category_list"=>["技術"], "occupation_list"=>["イラストレーター", "その他職種"], "target_list"=>["中級者", "上級者", "専門・大学生", "社会人"], "content"=>"技術も凄いですが、ただただ流し観しているだけでも感動するほど美しい動画です。\r\n\r\n毛や目の細部までの描き込みに惚れ惚れします。\r\n頑張るモチベーションになりました！")
Post.create("user_id"=>"2", "title"=>"【イラスト制作の流れ】構図→塗りまでの流れ", "url"=>"https://www.youtube.com/watch?v=24S7HX0Ds7s", "category_list"=>["技術"], "occupation_list"=>["漫画家", "イラストレーター", "キャラクターデザイナー", "アニメーター"], "target_list"=>["初心者", "小学生以下", "中学・高校生", "専門・大学生", "社会人"], "content"=>"プロでも写真を撮ってポーズを描いていると知って、面倒臭がらずやる事が大事なんだと思わされる動画でした。")
Post.create("user_id"=>"1", "title"=>"奥行きがある絵の描き方と練習法を学ぶ", "url"=>"https://www.youtube.com/watch?v=r6UPYLj20Js", "category_list"=>["技術"], "occupation_list"=>["漫画家", "イラストレーター", "コンセプトアーティスト", "アニメーター", "絵本作家"], "target_list"=>["初心者", "中級者", "中学・高校生", "専門・大学生", "社会人"], "content"=>"背景を描く時にパースばかりに気を取られていましたが、背景の描き方の奥深さを知れる動画でした。\r\n\r\n背景を描くことに行き詰まった時に観ると良いと思います。")
Post.create("user_id"=>"2", "title"=>"100均のクレヨンでリアルな樹木が凄い!", "url"=>"https://www.youtube.com/watch?v=cy89WHFKSyQ", "category_list"=>["技術"], "occupation_list"=>["コンセプトアーティスト", "アニメーター", "絵本作家", "その他職種"], "target_list"=>["上級者", "社会人"], "content"=>"日頃アニメキャラクターのイラストを描いている時にふと、クレヨンで描きたくなって見つけた動画でしたが、100均のクレヨンでも極めればここまで繊細な表現ができることに驚きです！\r\n\r\nイラストは、紙とペンさえあれば始められる最高の趣味だと改めて感じることができました。")
Post.create("user_id"=>"2", "title"=>"100均のクレヨンでリアルな夏の風景が凄い!", "url"=>"https://www.youtube.com/watch?v=mnrjPDLGOSE", "category_list"=>["技術"], "occupation_list"=>["コンセプトアーティスト", "アニメーター", "絵本作家", "その他職種"], "target_list"=>["上級者", "社会人"], "content"=>"クレヨンでの表現が素晴らしいです。\r\n\r\nこの100均クレヨンシリーズの動画をもっと観たいですね!")
Post.create("user_id"=>"5", "title"=>"この悩みはわかりすぎて辛い", "url"=>"https://www.youtube.com/watch?v=CuVdgRWXFYY", "category_list"=>["メンタル"], "occupation_list"=>["漫画家", "イラストレーター", "キャラクターデザイナー", "コンセプトアーティスト", "アニメーター", "絵本作家", "その他職種"], "target_list"=>["中級者", "上級者", "専門・大学生", "社会人"], "content"=>"スランプの時に観るといいと思います。")
Post.create("user_id"=>"8", "title"=>"アニメーションの作り方-動画の描き方", "url"=>"https://www.youtube.com/watch?v=dJWdkyMo8gc", "category_list"=>["技術"], "occupation_list"=>["アニメーター"], "target_list"=>["初心者", "小学生以下", "中学・高校生", "専門・大学生", "社会人"], "content"=>"初心者向けにイラストをアニメーションにするやり方を教えてくれています。\r\n動画時間も非常に短くて隙間時間に最適な動画です。")
Post.create("user_id"=>"1", "title"=>"上手い絵を見て凹んでしまう人へ", "url"=>"https://www.youtube.com/watch?v=X_28AjPPYj4", "category_list"=>["メンタル"], "occupation_list"=>["漫画家", "イラストレーター", "キャラクターデザイナー", "コンセプトアーティスト", "アニメーター", "絵本作家", "その他職種"], "target_list"=>["初心者", "中級者", "上級者", "小学生以下", "中学・高校生", "専門・大学生", "社会人"], "content"=>"他人とすぐ比べて凹んでしまうことが悩みだったので、少し救われる動画でした。\r\n\r\n動画にもある様に、尾田先生や鳥山先生は素直に凄いですよね。")
Post.create("user_id"=>"3", "title"=>"【参考になる】服のデザインの考え方・服の描き方", "url"=>"https://www.youtube.com/watch?v=en03UW4fmpk", "category_list"=>["知識", "技術"], "occupation_list"=>["漫画家", "イラストレーター", "キャラクターデザイナー", "アニメーター", "絵本作家"], "target_list"=>["初心者", "中級者", "小学生以下", "中学・高校生", "専門・大学生", "社会人"], "content"=>"やっぱりただただ描くのではなく、考えながら描くことが非常に大事なのだと改めて教わる動画でした。\r\n\r\n自分自身の描ける服のレパートリーを少しずつでも増やしていけるように頑張りたいですね。")
Post.create("user_id"=>"3", "title"=>"漫画家になるにはまず【漫画家志望者の末路】を知ろう。漫画家はギャンプルなのか？", "url"=>"https://www.youtube.com/watch?v=lhNeFq_B3ME", "category_list"=>["知識", "メンタル"], "occupation_list"=>["漫画家"], "target_list"=>["初心者", "中学・高校生", "専門・大学生"], "content"=>"SNSで誰でもインターネット上に漫画を発信できる時代だからこその利点をしっかり解説してくれています。\r\n\r\n漫画家志望の方には、心に突き刺さる動画になるのではないでしょうか!?")
Post.create("user_id"=>"6", "title"=>"沢山絵を描いてるのに、練習してるのに上達しないと悩んでいる方へ", "url"=>"https://www.youtube.com/watch?v=3UZD14iPG8A", "category_list"=>["知識", "技術", "メンタル"], "occupation_list"=>["漫画家", "イラストレーター", "キャラクターデザイナー", "コンセプトアーティスト", "アニメーター", "絵本作家"], "target_list"=>["中級者", "小学生以下", "専門・大学生", "社会人"], "content"=>"有名な絵師の方はやっぱりかなりの時間を絵に費やした結果なんですよね。\r\n\r\nスランプを払拭できる動画です。")

Like.create(post_id: 1, user_id: 1)
Like.create(post_id: 1, user_id: 2)
Like.create(post_id: 1, user_id: 5)

Like.create(post_id: 3, user_id: 2)
Like.create(post_id: 3, user_id: 3)
Like.create(post_id: 3, user_id: 6)
Like.create(post_id: 3, user_id: 8)
Like.create(post_id: 4, user_id: 1)
Like.create(post_id: 4, user_id: 3)
Like.create(post_id: 4, user_id: 6)
Like.create(post_id: 5, user_id: 1)
Like.create(post_id: 5, user_id: 5)
Like.create(post_id: 5, user_id: 6)
Like.create(post_id: 6, user_id: 6)
Like.create(post_id: 7, user_id: 3)
Like.create(post_id: 7, user_id: 5)
Like.create(post_id: 7, user_id: 6)
Like.create(post_id: 7, user_id: 7)

Like.create(post_id: 9, user_id: 1)
Like.create(post_id: 9, user_id: 5)
Like.create(post_id: 9, user_id: 7)
Like.create(post_id: 10, user_id: 5)
Like.create(post_id: 10, user_id: 6)
Like.create(post_id: 10, user_id: 7)
Like.create(post_id: 10, user_id: 8)
Like.create(post_id: 11, user_id: 1)
Like.create(post_id: 11, user_id: 6)
Like.create(post_id: 12, user_id: 2)
Like.create(post_id: 12, user_id: 3)
Like.create(post_id: 12, user_id: 6)
Like.create(post_id: 12, user_id: 7)

Like.create(post_id: 14, user_id: 1)
Like.create(post_id: 14, user_id: 5)
Like.create(post_id: 14, user_id: 6)
Like.create(post_id: 15, user_id: 2)
Like.create(post_id: 15, user_id: 5)
Like.create(post_id: 15, user_id: 6)
Like.create(post_id: 15, user_id: 7)
Like.create(post_id: 16, user_id: 1)
Like.create(post_id: 16, user_id: 2)
Like.create(post_id: 16, user_id: 3)
Like.create(post_id: 16, user_id: 5)
Like.create(post_id: 16, user_id: 7)
Like.create(post_id: 16, user_id: 8)

Like.create(post_id: 8, user_id: 2)
Like.create(post_id: 8, user_id: 3)
Like.create(post_id: 13, user_id: 3)
Like.create(post_id: 2, user_id: 5)
Like.create(post_id: 8, user_id: 5)
Like.create(post_id: 13, user_id: 5)
Like.create(post_id: 2, user_id: 6)
Like.create(post_id: 8, user_id: 6)
Like.create(post_id: 8, user_id: 8)

Relationship.create(follower_id: 1, following_id: 7)
Relationship.create(follower_id: 1, following_id: 8)
Relationship.create(follower_id: 2, following_id: 3)
Relationship.create(follower_id: 3, following_id: 5)
Relationship.create(follower_id: 3, following_id: 6)
Relationship.create(follower_id: 3, following_id: 7)
Relationship.create(follower_id: 3, following_id: 8)
Relationship.create(follower_id: 4, following_id: 2)
Relationship.create(follower_id: 4, following_id: 3)
Relationship.create(follower_id: 4, following_id: 5)
Relationship.create(follower_id: 4, following_id: 6)
Relationship.create(follower_id: 4, following_id: 7)
Relationship.create(follower_id: 4, following_id: 8)
Relationship.create(follower_id: 5, following_id: 3)
Relationship.create(follower_id: 5, following_id: 7)
Relationship.create(follower_id: 5, following_id: 8)

Relationship.create(follower_id: 7, following_id: 3)
Relationship.create(follower_id: 7, following_id: 5)
Relationship.create(follower_id: 7, following_id: 6)
Relationship.create(follower_id: 7, following_id: 7)
Relationship.create(follower_id: 7, following_id: 8)
Relationship.create(follower_id: 8, following_id: 2)
Relationship.create(follower_id: 8, following_id: 6)
Relationship.create(follower_id: 8, following_id: 7)

Relationship.create(follower_id: 3, following_id: 1)
Relationship.create(follower_id: 4, following_id: 1)
Relationship.create(follower_id: 5, following_id: 1)
Relationship.create(follower_id: 7, following_id: 1)
Relationship.create(follower_id: 8, following_id: 1)

Comment.create(content: "凄く勉強になる。", user_id: 3, post_id: 1)
Comment.create(content: "簡単に可愛い目が描けました", user_id: 7, post_id: 1)
Comment.create(content: "こういう動画を待っていました！", user_id: 8, post_id: 1)

Comment.create(content: "男女の描き分けの仕方が短い動画でよくまとめられていて、勉強になります。", user_id: 5, post_id: 3)
Comment.create(content: "凄く分かりやすいです。", user_id: 6, post_id: 3)
Comment.create(content: "女性キャラを描くのが苦手だったので、とても参考になります。", user_id: 5, post_id: 4)
Comment.create(content: "描き分け方が分かって、助かりました。", user_id: 7, post_id: 4)
Comment.create(content: "ここまでなるのにどのくらい描いてきたんだろうか...\nいつかこうなりたい", user_id: 2, post_id: 6)
Comment.create(content: "上手い！", user_id: 6, post_id: 6)
Comment.create(content: "細かいなぁ", user_id: 7, post_id: 6)
Comment.create(content: "線画の時点で上手過ぎる!", user_id: 8, post_id: 6)
Comment.create(content: "分かりやすいですね", user_id: 3, post_id: 7)
Comment.create(content: "天才！", user_id: 8, post_id: 7)

Comment.create(content: "クレヨンで色を塗ると淡く濡れて良いですよね。\n100均のクレヨンを今度使ってみようと思いました。", user_id: 4, post_id: 9)
Comment.create(content: "凄い！", user_id: 7, post_id: 10)
Comment.create(content: "クレヨンは、小学生以来使ってないな...", user_id: 8, post_id: 10)
Comment.create(content: "サムネが可愛いw", user_id: 3, post_id: 11)
Comment.create(content: "凄く為になりました！", user_id: 6, post_id: 11)
Comment.create(content: "救われた。", user_id: 7, post_id: 11)
Comment.create(content: "アニメーション作ってみようと思っていたので、助かります。\n次は、カラーでの解説も観てみたいです。", user_id: 6, post_id: 12)

Comment.create(content: "デザイン考えられる方、尊敬します！", user_id: 4, post_id: 14)
Comment.create(content: "服描くの苦手...", user_id: 6, post_id: 14)
Comment.create(content: "将来について深く考えますね", user_id: 2, post_id: 15)
Comment.create(content: "twitterでの発信を頑張ろうと思います。", user_id: 5, post_id: 15)
Comment.create(content: "為になるなぁ〜\n頑張ろう！", user_id: 7, post_id: 15)
Comment.create(content: "ギャンブルじゃないという考え方もあるんですね！", user_id: 8, post_id: 15)
Comment.create(content: "イラストを描くやる気が出ました！", user_id: 3, post_id: 16)

Comment.create(content: "線画作業が苦手だったので参考にさせていただきます！", user_id: 2, post_id: 2)
Comment.create(content: "時間短縮の為にもこの時短術を身につけたい!!!", user_id: 5, post_id: 2)
Comment.create(content: "私もパースにばかりに気を囚われて背景に苦手意識がありました。", user_id: 4, post_id: 8)

Comment.create(content: "この記事を読んで、100均でクレヨンを買いました！\n描き心地が思いのほか良いです。", user_id: 1, post_id: 9)
Comment.create(content: "凄く助かりました！\nありがとうございます。", user_id: 1, post_id: 16)
Comment.create(content: "> テストユーザー さん\nこの記事がきっかけでクレヨンを購入したのですか！\n何だか嬉しいです。ありがとうございます。", user_id: 2, post_id: 9)
Comment.create(content: "> テストユーザー さん\nいえいえ、お役に立てて光栄です！", user_id: 6, post_id: 16)

Notification.create(visitor_id: 5, visited_id: 1, post_id: 8, action: "like")
Notification.create(visitor_id: 2, visited_id: 1, post_id: 2, action: "like")
Notification.create(visitor_id: 3, visited_id: 1, action: "follow")
Notification.create(visitor_id: 4, visited_id: 1, action: "follow")
Notification.create(visitor_id: 6, visited_id: 1, post_id: 8, action: "like")
Notification.create(visitor_id: 2, visited_id: 1, post_id: 2, comment_id: 28, action: "comment")
Notification.create(visitor_id: 5, visited_id: 1, action: "follow")
Notification.create(visitor_id: 3, visited_id: 1, post_id: 13, action: "like")
Notification.create(visitor_id: 5, visited_id: 1, post_id: 2, comment_id: 29, action: "comment")
Notification.create(visitor_id: 8, visited_id: 1, post_id: 8, action: "like")
Notification.create(visitor_id: 7, visited_id: 1, action: "follow")
Notification.create(visitor_id: 7, visited_id: 1, post_id: 8, comment_id: 30, action: "comment")
Notification.create(visitor_id: 5, visited_id: 1, post_id: 13, action: "like")
Notification.create(visitor_id: 2, visited_id: 1, post_id: 9, comment_id: 33, action: "comment")
Notification.create(visitor_id: 3, visited_id: 1, post_id: 8, action: "like")
Notification.create(visitor_id: 6, visited_id: 1, post_id: 2, action: "like")
Notification.create(visitor_id: 6, visited_id: 1, post_id: 16, comment_id: 34, action: "comment")
Notification.create(visitor_id: 5, visited_id: 1, post_id: 2, action: "like")
Notification.create(visitor_id: 8, visited_id: 1, action: "follow")