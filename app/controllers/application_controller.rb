class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  ## before_action :authenticate_user! ##

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :nick_name, :encrypted_password, :family_name, :first_name, :kana_family_name, :kana_first_name :birth_date])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']  # 環境変数を読み込む記述に変更
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end