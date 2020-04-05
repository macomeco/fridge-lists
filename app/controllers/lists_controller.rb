class ListsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :edit, :show, :update]

  def create
    @list = current_user.lists.build(lists_params)
    if @list.save
      flash[:success] = 'お部屋を追加しました'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:success] = 'お部屋の追加に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end
  
  def edit
    @user = current_user.user.find_by(id: params[:id])
  end
  
  def update
      if @list.update(tags_params)
          flash[:success] = 'お部屋を設定しました'
      redirect_back(fallback_location: root_path)
      else
          flash.now[:danger] = 'お部屋の設定に失敗しました'
      redirect_back(fallback_location: root_path)
      end
  end
  
  
  def destroy
    @list.destroy
    flash[:success] = 'お部屋を削除しました'
    redirect_back(fallback_location: root_path)
  end
  
  private
  def lists_params
    params.require(:list).permit(:name)
  end
  
  def correct_user  #編集するタグがユーザのタグか判定
    @list = current_user.lists.find_by(id: params[:id])
    unless @list
    redirect_back(fallback_location: root_path)
    end
  end
  
end
