class UsersController < ApplicationController
  before_action :require_login, only: [:destroy]

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      sign_in_success(@user)
    else
      sign_in_failure
    end
  end

  def destroy
    user = current_user

    if user && user.destroy
      delete_user_success
    else
      delete_user_failure
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def sign_in_success(user)
    session[:user_id] = user.id
    redirect_to home_path, notice: I18n.t('users.create.success')
  end

  def sign_in_failure
    flash.now[:alert] = I18n.t('users.create.failure')
    render :new, status: :unprocessable_entity
  end

  def delete_user_success
    session.delete(:user_id)
    redirect_to root_path, notice: I18n.t('users.destroy.success'), status: :see_other
  end

  def delete_user_failure
    flash[:alert] = I18n.t('users.destroy.failure')
    redirect_to home_path, status: :unprocessable_entity
  end
end
