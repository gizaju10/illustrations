class ApplicationController < ActionController::Base
  before_action :tags
  protect_from_forgery with: :exception

  # deviseコントローラーにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    posts_path
  end

  def tags
    @categories = ActsAsTaggableOn::Tag.named_any(%w[知識 技術 メンタル その他カテゴリー]).order('id')
    @occupations = ActsAsTaggableOn::Tag.named_any(%w[漫画家 イラストレーター キャラクターデザイナー コンセプトアーティスト アニメーター 絵本作家
                                                      その他職種]).order('id')
    @targets = ActsAsTaggableOn::Tag.named_any(['初心者', '中級者', '上級者', '小学生以下', '中学・高校生', '専門・大学生', '社会人']).order('id')
    @inquiry = Inquiry.new
  end

  protected

  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name image])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name profile image])
  end
end
