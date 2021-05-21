[![gizaju10](https://circleci.com/gh/gizaju10/illustrations.svg?style=svg)](https://circleci.com/gh/gizaju10/illustrations)

# IllustTube
『IllustTube』は絵を描く全ての方へ向けたYouTUbe動画学習サービスです。  
ゲストログインを用意しておりますので、どなたでも使用できるようにしております。

###  [リンク]：( https://illusttube.work )

## トップページ


## 使用した技術
* フロントエンド
  * HTML/CSS
  * JavaScript
  * jQuery
* バックエンド
  * Ruby 3.0.1
  * Ruby on Rails 6.1.3.1
  * YouTube Data API
  * Rspec
* インフラ・開発環境
  * MacBook Air macOS Big Sur 11.3.1
  * Docker/Docker-compose
  * AWS（ECR,ECS(EC2),VPC,S3,Route53,ALB,RDS(PostgreSQL 12.5),ACM）
  * CircleCI(CIのみ)
  * Nginx/Puma

## ER図
![ER](https://user-images.githubusercontent.com/60719889/119190379-3a4ff700-bab8-11eb-9e17-0d372b9f9e0d.png)

## インフラ構成図
![qws](https://user-images.githubusercontent.com/60719889/119190394-420f9b80-bab8-11eb-83bb-229f30a1c327.png)

## 機能一覧
| 機能名 | 主要gem | 説明 |
| ---- | ---- | ---- |
| ユーザー機能 | devise | 新規登録、登録内容変更、ログイン、ログアウト |
| Oauth機能  | omniauth-google-oauth2 | Googleアカウント使用でユーザー機能の使用 |
| 記事投稿機能 | - | 新規投稿、編集、削除 |
| タグ管理機能 | acts-as-taggable-on | 記事に対してタグの追加、削除 |
| 記事シェア機能 | - | twitter/LINEに記事をシェアできるボタン |
| YouTube検索機能 | google-api-client | YouTubeの動画検索機能(YouTube Data API)|
| いいね機能 | - | 記事にいいねができる(Ajax)、いいねを消す(Ajax) |
| コメント機能 | - | コメントを投稿(Ajax)、削除(Ajax)、編集(一部Ajax) |
| お問い合わせ機能 | - | 未ログイン時でも管理者に問い合わせができる、モーダルウィンドウで表示(jQuery) |
| 管理者機能 | devise | id: 2 ユーザーにのみ全ユーザーのアカウント削除、全投稿の削除/編集、全投稿の削除/編集|
