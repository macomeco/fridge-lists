class SessionsController < ApplicationController

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = 'ログインに失敗しました。'
      #render root_path
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def login(email, password)
    @user =User.find_by(email: email)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
  
end
