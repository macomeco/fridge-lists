class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    @user.theme ||= 'sodapop'
    if @user.save!
      flash[:success] = 'ユーザーを登録しました'
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = 'ユーザーの登録に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
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
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :theme)
  end
  
end

