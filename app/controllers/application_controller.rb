class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    current_user.present?
  end

  def require_login
    return if logged_in?

    flash[:alert] = I18n.t('application.require_login')
    redirect_to new_session_path
  end
end
