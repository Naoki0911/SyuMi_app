class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to sakes_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def guest_admin_sign_in
    user = User.guest_admin
    sign_in user
    redirect_to sakes_path, notice: '管理者用ゲストユーザーとしてログインしました。'
  end

  helper_method :homepage?

  def homepage?
    request.path == root_path || request.path == new_user_session_path || request.path == new_user_registration_path
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  private

  def after_sign_in_path_for(resource)
    sakes_path
  end
  
end
