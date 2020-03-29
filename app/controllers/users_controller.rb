class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザーを登録しました'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました'
#     render template: "users/new"
      redirect_back(fallback_location: root_path)

    end
  end

  def edit
  end

  def update
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :emial, :password, :password_confirmation)
  end


end

