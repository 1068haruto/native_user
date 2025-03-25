class SessionsController < ApplicationController
  def new; end
  
  def create
    Rails.logger.debug "Params: #{params.inspect}" # 追加

    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to home_path, notice: "ログインしました"
    else
      flash.now[:alert] = "メールアドレスまたはパスワードが間違っています"
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "ログアウトしました"
  end
end
