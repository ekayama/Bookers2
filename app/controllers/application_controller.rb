class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  # uthenticate_user!→ログインしていなければログイン画面にリダイレクトする機能
  # exceptは指定したアクションをbefore_action（全ての動作が行われる前に実装される）の対象から外す
  # ＝exceptに指定されたアクションはログインしていなくても表示できる
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end
