require 'rails_helper'

RSpec.describe '新規投稿', type: :system do
  before do
    @user = create(:user)
    @post = create(:post)
  end

  context '新規投稿ができるとき' do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      @user.confirm
      sign_in(@user)
      visit new_post_path
      fill_in 'post_title', with: @post.title
      fill_in 'post_url', with: @post.url
      check "post_category_list_知識"
      check "post_occupation_list_漫画家"
      check "post_target_list_初心者"
      fill_in 'post_content', with: @post.content
      expect  do
        click_on '投稿する'
      end.to change { Post.count }.by(1)
      # トップページに遷移し、投稿した情報が存在する
    id = @post.id.to_i + 1
      expect(current_path).to eq "/posts/#{id}"
      expect(page).to have_content(@post.title)
    end
  end

  context '新規投稿ができないとき' do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      visit new_post_path
      # 新規投稿ページへのリンクがない
      expect(page).to have_no_content('新規投稿')
    end
    it '投稿内容が空だと投稿できない' do
      # ログインする
      @user.confirm
      sign_in(@user)
      visit new_post_path
      # 「新規投稿」をクリックし、新規投稿ページへ遷移する
      first(:link, '新規投稿').click
      expect(current_path).to eq new_post_path
      # フォームが空のまま、投稿ボタンを押してもPostモデルのカウントが変わらない
      fill_in 'post_title', with: ''
      fill_in 'post_url', with: @post.url
      check "post_category_list_知識"
      check "post_occupation_list_漫画家"
      check "post_target_list_初心者"
      expect  do
        find('input[name="commit"]').click
      end.to change { Post.count }.by(0)
      # 新規投稿ページへ戻される
      expect(current_path).to eq '/posts'
    end
  end
end

RSpec.describe '投稿内容の編集', type: :system do
  before do
    @user = create(:user)
    @post1 = create(:post, user: @user)
    @post2 = create(:post)
  end
  context '投稿内容が編集できるとき' do
    it 'ログインしたユーザーは、自分が投稿した投稿内容を編集ができる' do
      # 投稿1を投稿したユーザーでログインする
      @user.confirm
      sign_in(@user)
      # 投稿1の詳細ページへ遷移する
      visit post_path(@post1)
      # 編集するボタンをクリックし、編集ページへ遷移する
      find_link('編集').click
      expect(current_path).to eq edit_post_path(@post1)
      # すでに投稿済みの内容がフォームに入っている
      expect(
        find('#post_title').value
      ).to eq @post1.title
      expect(
        find('#post_url').value
      ).to eq @post1.url
      expect(
        find("#post_category_list_知識").value
      ).to eq @post1.category_list.join(',')
      expect(
        find("#post_occupation_list_漫画家").value
      ).to eq @post1.occupation_list.join(',')
      expect(
        find("#post_target_list_初心者").value
      ).to eq @post1.target_list.join(',')

      expect(
        find('#post_content').value
      ).to eq @post1.content
      # 投稿内容を編集する
      image_path = Rails.root.join('public/images/place_image.png')
      fill_in 'post_title', with: "#{@post1.title}+編集OK!"
      fill_in 'post_url', with: "#{@post1.url}+編集OK!"
      
      # チェックボックスの変更も追加要

      fill_in 'post_content', with: "#{@post1.content}+編集OK!"
      # 編集してもPostモデルのカウントは変わらない
      expect  do
        find('input[name="commit"]').click
      end.to change {Post.count}.by(0)
      # トップページには編集した内容の投稿が存在する
      expect(current_path).to eq "/posts/#{@post1.id}"
      expect(page).to have_content("#{@post1.title}+編集OK!")
    end
  end
  context '投稿内容が編集できないとき' do
    it 'ログインしたユーザーは、自分以外が投稿した投稿の編集画面には遷移できない' do
      # 投稿1を投稿したユーザーでログインする
      @user.confirm
      sign_in(@user)
      # 投稿2の詳細ページへ遷移する
      visit post_path(@post2)
      expect(current_path).to eq post_path(@post2)
      # 投稿2に編集ボタンがない
      expect(page).to have_no_link '編集', href: edit_post_path(@post2)
    end
    it 'ログインしていないと、投稿の編集画面には遷移できない' do
      # トップページにいる
      visit root_path
      # 投稿1の詳細ページへ遷移する
      visit post_path(@post1)
      # 投稿1に編集ボタンがない
      expect(page).to have_no_link '編集', href: edit_post_path(@post1)
    end
  end
end

RSpec.describe '投稿の削除', type: :system, js: true do
  before do
    @user = create(:user)
    @post1 = create(:post, user: @user)
    @post2 = create(:post)
  end
  context '投稿の削除ができるとき' do
    it 'ログインしたユーザーは、自らの投稿を削除できる' do
      # 投稿1を投稿したユーザーでログインする
      @user.confirm
      sign_in(@user)   
      # 投稿1の詳細ページへ遷移する
      visit post_path(@post1)
      # 投稿を削除するとレコードの数が1減る
      expect do
        find_link('削除').click
        expect(page.driver.browser.switch_to.alert.text).to eq "本当に削除しますか?"
        page.driver.browser.switch_to.alert.accept
      end.to change { Post.count }.by(0)
      # トップページに遷移する
      expect(current_path).to eq "/posts"
      # トップページには投稿1の内容が存在しない
      expect(page).to have_no_content(@post1.title.to_s)
      # expect(page).to have_selector('.mini-slide-image')
      expect(page).to have_no_content(@post1.url.to_s)
      expect(page).to have_no_content(@post1.content.to_s)
    end
  end
  context '投稿の削除ができないとき' do
    it 'ログインしたユーザーは、自分以外の投稿を削除できない' do
      # 投稿1を投稿したユーザーでログインする
      sign_in(@post1.user)
      # 投稿2の詳細ページへ遷移する
      visit post_path(@post2)
      # 投稿2に削除ボタンがない
      expect(page).to have_no_link '削除', href: post_path(@post2)
    end
    it 'ログインしていないと、投稿の削除ボタンがない' do
      # トップページに移動する
      visit root_path
      # 投稿1の文章をクリックし、投稿1の詳細ページへ遷移する
      visit post_path(@post1)
      # 投稿1に削除ボタンが無い
      expect(page).to have_no_link '削除', href: post_path(@post1)
    end
  end
end

RSpec.describe '投稿詳細', type: :system do
  before do
    @user = create(:user)
    @post = create(:post)
  end
  it 'ログインしたユーザーは、投稿詳細ページに遷移してコメント投稿欄が表示される' do
    # ログインする
    @user.confirm
    sign_in(@post.user)
    # 投稿の文章をクリックし、投稿詳細ページへ遷移する
    visit post_path(@post)
    # コメント用のフォームが存在する
    expect(page).to have_selector 'form'
  end
  it 'ログインしていない状態では、投稿詳細ページに遷移できるものの、コメント投稿欄が表示されない' do
    # 投稿詳細ページへ遷移する
    visit post_path(@post)
    # コメント用のフォームが存在しない
    expect(page).to have_no_selector 'form'
  end
end