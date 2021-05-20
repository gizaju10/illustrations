require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = build(:user)
  end

  context 'ユーザー新規登録ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # 確認メール・ログインページに遷移するボタンがある
      expect(page).to have_link '確認メール', href: new_user_confirmation_path
      expect(page).to have_link 'ログイン', href: new_user_session_path
      # ユーザー情報を入力する
      fill_in 'user_name', with: @user.name
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      fill_in 'user_password_confirmation', with: @user.password_confirmation
      # # 新規登録ボタンを押すとuserモデルのカウントが1上がる
      expect  do
        click_on '新規登録する'
      end.to change { User.count }.by(1)
      # トップページへ遷移する
      expect(current_path).to eq root_path
    end
  end

  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページ(新規登録ページ)に移動する
      visit root_path
      # 空のユーザー情報を入力する
      fill_in 'user_name', with: ''
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
      fill_in 'user_password_confirmation', with: ''
      # 新規登録ボタンを押してもユーザーモデルのカウントは上がらない
      expect  do
        click_on '新規登録する'
      end.to change { User.count }.by(0)
      # 新規登録ページへ戻される
      expect(current_path).to eq '/users'
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = create(:user)
    @gest
  end
  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      # トップページに移動する
      visit root_path
      # ログインページへ遷移する
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      # ログインボタンを押す
      all('input[name="commit"]')[1].click
      # トップページへ遷移する
      expect(current_path).to eq user_session_path
    end
  end

  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      # トップページに移動する
      visit root_path
      # ログインページへ遷移する
      visit new_user_session_path
      # 空のユーザー情報を入力する
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
      # ログインボタンを押す
      all('input[name="commit"]')[1].click
      # ログインページへ戻される
      expect(current_path).to eq new_user_session_path
    end
  end
end