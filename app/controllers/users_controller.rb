class UsersController < ApplicationController
  #before_action :require_user_logged_in, only: [:show]
  #before_action :correct_user, only: [:destroy, :edit, :show, :update,]

  def new
    @user = User.new
  end

  def create
    @user = User.new(new_user_params)
    if @user.save
      flash[:success] = 'ユーザーを登録しました'
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = 'ユーザーの登録に失敗しました'
#     render template: "users/new"
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(edit_user_params)
      if user_params[:theme].to_s == 'sodapop'
        instance_variable_set('@theme',$sodapop )
      elsif user_params[:theme].to_s == 'melon'
        instance_variable_set('@theme',$melon )
      elsif user_params[:theme].to_s == 'mono'
        instance_variable_set('@theme',$mono )
      elsif user_params[:theme].to_s == 'cake'
        instance_variable_set('@theme',$cake )
      end  
      flash[:success] = 'ユーザーを編集しました'
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = 'ユーザーは編集されませんでした'
      redirect_back(fallback_location: root_path)
    end
  end
  
  private
  
  def new_user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, theme: 'sodapop')
  end

  def edit_user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,:theme)
  end

  
end

