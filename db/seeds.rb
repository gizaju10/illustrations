# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

array = %w(知識 技術 メンタル 漫画家 イラストレーター キャラクターデザイナー コンセプトアーティスト アニメーター CGクリエイター 絵本作家 初心者 中級者 上級者 小学生以下 中学・高校生 専門・大学生 社会人)
array.each{ |tag|
  tag_list = ActsAsTaggableOn::Tag.new
  tag_list.name = tag
  tag_list.save
}