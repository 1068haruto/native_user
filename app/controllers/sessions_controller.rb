class SessionsController < ApplicationController
  before_action :require_login, only: [:destroy]

  def new; end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user&.authenticate(params[:session][:password])
      login_success(user)
    else
      login_failure
    end
  end
  
  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: I18n.t('sessions.destroy.success'), status: :see_other
  end

  private

  def login_success(user)
    session[:user_id] = user.id
    redirect_to home_path, notice: I18n.t('sessions.create.success')
  end

  def login_failure
    flash.now[:alert] = I18n.t('sessions.create.failure')
    render :new, status: :unprocessable_entity
  end
end
