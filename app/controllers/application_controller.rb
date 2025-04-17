class ApplicationController < ActionController::Base
  # Deviseコントローラーを使用の際に、configure_permitted_parametersメソッドを呼び出す
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Strong Parametersの設定
  def configure_permitted_parameters
    # サインアップ時に :avatar を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])

    # アカウント情報更新時に :avatar を許可
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end
