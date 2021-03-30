require "rails_helper"

RSpec.describe "Posts", type: :request do
  let!(:user) { build(:user) }
  let!(:other_user) { create(:user) }

  # let(:test_post) { create(:post, user_id: user.id) }
  # let(:test_post2) { create(:post, user_id: other_user.id) }
  let(:test_post) { create(:post, user: user) }
  let(:test_post2) { create(:post, user: other_user) }
  # let(:post_photo) { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/image/main_top.jpg")) }
  # let(:post_params) { { area: "area", post_photo: post_photo } }

  describe "index" do
    before { get posts_path }

    example "未ログインでリクエストが失敗すること" do
      expect(response).to have_http_status(302)
    end
  end

  describe "show" do
    before { get post_path(test_post.id) }

    example "リクエストが成功すること" do
      expect(response).to have_http_status(302)
    end
  end

  describe "new" do
    context "ログイン時" do
      before do
        user.confirm
        sign_in user
        get new_post_path
      end

      example "リクエストが成功すること" do
        expect(response).to have_http_status(200)
      end
    end

    context "非ログイン時" do
      before { get new_post_path }

      example "サインイン画面へリダイレクトされること" do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "create" do
    # context "ログイン時" do
    #   # before { user.confirm sign_in user }
    #   before do
    #     user.confirm
    #     sign_in user
    #   end

    #   example "正常に投稿を作成できること" do
    #     expect do
    #       # post posts_path, params: { post: attributes_for(:test_post) }
    #       # post posts_path, params: post_params
    #       # post posts_path, params: { post: post_params }
    #       # post posts_path, params: post_params, as: :json
    #       # post posts_path, params: { post: {to_param:post_params }
    #     end.to change(Post, :count).by(1)
    #   end
    # end

    context "非ログイン時" do
      before { get new_post_path }

      example "サインイン画面へリダイレクトされること" do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'edit' do
    context 'ログインしている時' do
      context '本人の場合' do
        before do
          user.confirm
          sign_in user
          get edit_post_path(test_post.id)
        end

        example '200レスポンスを返すこと' do
          expect(response).to have_http_status(200)
        end
      end

      context '本人でない場合' do
        before { sign_in other_user }

        example '投稿一覧ページにリダイレクトされること' do
          expect do
            get edit_post_path(test_path.id)
            expect(response).to redirect_to posts_path
          end
        end
      end
    end

    context 'ログインしていない場合' do
      before { get edit_post_path(test_post.id) }

      example 'サインイン画面へリダイレクトされること' do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "destroy" do
    context "ログイン時" do
      context "投稿者本人の場合" do
        before do 
          sign_in user
        end

        example "投稿一覧ページにリダイレクトされること" do
          expect do
            delete post_path(test_post.id)
            expect(response).to redirect_to posts_path
          end
        end
      end

      context "本人でない場合" do
        # before { sign_in other_user }
        before do
          user.confirm
          sign_in user
        end

        # N＋1問題がある
        example "削除されないこと" do
          expect do
            delete post_path(test_post2.id)
          end.to change(Post, :count).by(0)
        end
      end
    end
  end
end