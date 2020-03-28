class UsersController < ApplicationController
  def show
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザーを登録しました'
      redirect_to root_path
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました'
      #render :new
    end
  end

  def edit
  end

  def update
  end

  private
  
  def user_params
    params.require(:user).premit(:name, :emial, :password, :password_confirmation)
  end


end

