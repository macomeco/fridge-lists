class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  #before_action :correct_user, only: [:destroy, :edit, :show, :update,]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    
    #カラーテーマ　ユーザーを新規登録した時点でカラーテーマ設定　ほかにやり方があるんだろうけどわかんなかった　デフォルト以外のがわからない
    theme1 = Colortheme.new(clr_main: "#46b1c9", clr_sub: "#f2e2d2", clr_list_i: "#84c0c6", clr_list_ii: "#9fb7b9", clr_font: "#717570")
    theme1.save

    theme2 = Colortheme.new(clr_main: "#262626", clr_sub: "#ebebeb", clr_list_i: "#7f7f7f", clr_list_ii: "#bfbfbf", clr_font: "#3f3f3f")
    theme2.save
    
    theme3 = Colortheme.new(clr_main: "#61988E", clr_sub: "#f0eaf2", clr_list_i: "#BEDFC3", clr_list_ii: "#8FC0A9", clr_font: "#493843")
    theme3.save 
    
    #保留　トリコロール的な色
    theme4 =  Colortheme.new(clr_main: "#9BC1BC", clr_sub: "#F4F1BB", clr_list_i: "#F49683", clr_list_ii: "#AEC59E", clr_font: "#5D576B")
    theme4.save
    
  end

  def create
    @user = User.new(user_params)
    
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
      if current_user.update(user_params)
        flash[:success] = 'ユーザーを編集しました'
        redirect_back(fallback_location: root_path)
      else
        flash[:error] = 'ユーザーは編集されませんでした'
        redirect_back(fallback_location: root_path)
      end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end

