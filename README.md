[![gizaju10](https://circleci.com/gh/gizaju10/illustrations.svg?style=svg)](https://circleci.com/gh/gizaju10/illustrations)

# IllustTube
<strong>『IllustTube』</strong>は絵を描く全ての方へ向けたYouTube動画学習サービスです。  
YouTube Data API を用いて動画検索を行い、オススメ動画をシェアすることができます。

###  [リンク]：( https://illusttube.work )

# 制作背景
私は、高等学校卒業後、２年間専門学校に通いました。学科は、マンガです。  
マンガ学科では、漫画家になる為の学習をしました。  
しかし、学んだ知識や技術はYouTubeで個人が有益な情報を無料で発信する昨今では、独学でも簡単に得れる内容でした。  
その経験からYouTubeで独学者を対象にした学習をサポートするサービスとして開発しました。

今回、本アプリ開発含むプログラミング学習に関しましては、独学で実施しました。

### 目的のターゲット層
* イラストに携わる知識や技術等を独学で学びたい方(全年齢対象)
* イラストを描く仲間を増やしたい方(独学者で同じ分野に興味がある仲間を探しやすい)

# 機能紹介
## ゲストログイン
<strong>『テストログイン』</strong>を用意しておりますので、どなたでもご利用できる様にしております。  
<img src="https://user-images.githubusercontent.com/60719889/119719537-dbb5bf00-bea3-11eb-991a-43013378888c.png" width="640">

![ログイン2](https://user-images.githubusercontent.com/60719889/119720877-7b278180-bea5-11eb-93b3-9468c91c10ec.png)
<br>
<br>
<br>

## 記事一覧機能
ログインすると記事一覧を<strong>自動スクロール</strong>でストレスフリーに閲覧できます。  
![ログイン_PC_2](https://user-images.githubusercontent.com/60719889/119719127-5e8a4a00-bea3-11eb-850c-5805877e161f.gif)
<br>
<br>
<br>

## 投稿機能
YouTubeの動画を検索して自由に投稿ができます。  
![4](https://user-images.githubusercontent.com/60719889/119744363-ce5dfc00-bec6-11eb-8863-dc46682169a0.png)
<br>
<br>
<br>

① 検索窓から投稿したい動画を検索します。  
② <strong>『この動画を投稿する』</strong>から投稿したい動画を選択します。  
<img src="https://user-images.githubusercontent.com/60719889/119724050-2ab22300-bea9-11eb-9801-343d1f93734f.png" width="640">
<br>
<br>
<br>

③ 投稿する内容を記述します。  
④ <strong>『投稿する』</strong>を押すことで投稿が完了します。  
<img src="https://user-images.githubusercontent.com/60719889/119724099-3aca0280-bea9-11eb-95dd-eab00602b227.png" width="640">
<br>
<br>
<br>

## スマホからも快適
CSS グリッドレイアウトにより、スマートフォンからでも快適にご利用ができます。
![スマホ (1)](https://user-images.githubusercontent.com/60719889/119718972-313d9c00-bea3-11eb-9686-f74b8f22ba28.gif)
<br>
<br>
<br>

その他にもコメント機能やいいね機能等がAjax(非同期通信)で快適に利用できたり、  
直感的に使用できることを第一にUI/UXを気を付け開発しました。  
※ 詳細は、下記<strong>機能一覧</strong>にてご確認下さい。

# 機能一覧
| 機能名 | gem | 説明 |
| ---- | ---- | ---- |
| ユーザー機能 | devise, kaminari, actionmailer | 新規登録、登録内容変更、ログイン、ログアウト、ユーザー一覧/詳細の表示 |
| 管理者機能 | devise | id: 2 ユーザーにのみ全ユーザーのアカウント削除、全投稿の削除/編集、全投稿の削除/編集|
| Oauth機能  | omniauth-google-oauth2, kaminari | Googleアカウント使用でユーザー機能の使用 |
| 記事検索機能 | kaminari | 記事の関連キーワードから記事探せます |
| 記事一覧機能 | kaminari | 無限スクロールのプラグイン(jScroll)による記事一覧を表示 |
| タグ管理機能 | acts-as-taggable-on | 記事に対してタグの追加、削除 |
| タグ一覧機能 | acts-as-taggable-on, kaminari | タグ名をクリックする事でタグ毎の一覧をjScrollにて表示 |
| 記事シェア機能 | - | LINE/Twitterに記事をシェアできるボタン |
| YouTube検索機能 | google-api-client | YouTubeの動画検索機能(YouTube Data API)|
| いいね機能 | - | 記事にいいねができる(Ajax)、いいねを削除(Ajax) |
| コメント機能 | - | コメントを投稿(Ajax)、削除(Ajax)、編集(一部Ajax) |
| お問い合わせ機能 | actionmailer | 未ログイン時でも管理者に問い合わせができる、モーダルウィンドウで表示(jQuery) |

# 使用した技術
### フロントエンド
  * HTML/CSS
  * JavaScript
  * jQuery
  * Bootstrap
### バックエンド
  * Ruby 3.0.1
  * Ruby on Rails 6.1.3.1
### インフラ・開発環境
  * MacBook Air macOS Big Sur 11.3.1
  * Docker/Docker-compose
  * AWS（ECR,ECS(EC2),VPC,S3,Route53,ALB,RDS(PostgreSQL 12.5),ACM）
  * Nginx/Puma
### テスト
  * Rspec (単体・統合　計122項目）
  * CircleCIにてDocker-composeよりコンテナを構築し、自動テスト
### その他使用技術
  * YouTube Data API
  * RoboCop静的コード解析
  * Ajax(非同期通信)（投稿へのコメント・いいね、ユーザーのフォロー）
  * LINE/Twitterの記事シェアボタン
  * 無限スクロール(jScroll)
  * GitHub

# ER図
![ER](https://user-images.githubusercontent.com/60719889/119190379-3a4ff700-bab8-11eb-9e17-0d372b9f9e0d.png)

# インフラ構成図
![AWS最新](https://user-images.githubusercontent.com/60719889/121276334-7503bd00-c909-11eb-8278-32e38afdc63f.png)

# 今後実装したい機能
## MVCモデル
* 通知機能の拡張(フォロワーに対して投稿等を実施した場合に通知)
* 投稿機能の一時的保存(下書き)機能
* コメント返信機能
* ユーザー削除を物理削除から論理削除へ変更

## その他
* Rspecの更なる充実(特にJavaScriptを含む統合テスト)
* jQueryに代替するフレームワークやライブラリの使用(Vue.js, React等)
* 自動デプロイ機能をCircleCI Orbsまたは、Capistranoで実装
* Amazon ECS クラスターの起動タイプをEC2 → Fargateへ変更
* AWS ECS, RDSの冗長化

# 転職活動をしています
### Wantedly
https://www.wantedly.com/id/teppeimimachi

### Qiita
https://qiita.com/TeppeiMimachi
