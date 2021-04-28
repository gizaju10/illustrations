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
  * Rspec
* インフラ・開発環境
  * MacBook Air macOS Big Sur 11.2.3
  * Docker/Docker-compose
  * AWS（ECR,ECS(EC2),VPC,S3,Route53,ALB,RDS,ACM）
  * CircleCI

## ER図


## インフラ構成図

## 機能一覧
| 機能名 | Gem | 説明 |
| ---- | ---- | ---- |
| ユーザー機能 | devise | 新規登録、登録内容変更、ログイン、ログアウト |
| Oauth機能  |  | Googleアカウント使用でユーザー機能の使用 |
| 記事投稿機能 |  | 新規投稿、編集、削除 |
| 記事検索機能 |  | 記事検索(ユーザーネームからも検索可) |
| YouTube検索機能 |  | YouTubeの動画検索機能(YouTube Data API)|
| いいね機能 |  | 記事にいいねができる(Ajax)、いいねを消す(Ajax) |
| コメント機能 |  | コメントを投稿(Ajax)、削除(Ajax)、編集(一部Ajax) |
| 管理者機能 |  | id: 2 ユーザーにのみ全ユーザーのアカウント削除、全投稿の削除/編集、全投稿の削除/編集|
