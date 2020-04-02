class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  before_action :correct_user, only: [:destroy, :edit, :show, :update,]

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
    @user = User.find(params[:id])
  end

  def update
      if @user.update(user_params)
      flash[:success] = 'タグを編集しました'
      redirect_back(fallback_location: root_path)
      else
          flash.now[:danger] = 'タグは編集されませんでした'
      redirect_back(fallback_location: root_path)
      end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end

