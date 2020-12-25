class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!

  # deviseコントローラーにストロングパラメータを追加する          
  before_action :configure_permitted_parameters, if: :devise_controller?


  def tags
    @categories = ActsAsTaggableOn::Tag.named_any(["知識", "技術", "メンタル", "その他カテゴリー"])
    @occupations = ActsAsTaggableOn::Tag.named_any(["漫画家", "イラストレーター", "キャラクターデザイナー", "コンセプトアーティスト", "アニメーター", "絵本作家", "その他職種"])
    @targets = ActsAsTaggableOn::Tag.named_any(["初心者", "中級者", "上級者", "小学生以下", "中学・高校生", "専門・大学生", "社会人"])
  end

  protected
  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :image])
  end

end
