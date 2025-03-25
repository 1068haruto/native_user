class HomeController < ApplicationController
  before_action :require_login

  def index; end

  private

  def require_login
    unless session[:user_id]
      redirect_to root_path, alert: "ログインしてください"
    end
  end
end
