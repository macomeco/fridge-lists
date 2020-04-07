class TagsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :edit, :update]

  def create
    @tag = current_user.tags.build(tags_params)
    if @tag.save
      flash[:success] = 'タグを追加しました'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:success] = 'タグの追加に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end
  
  def edit
    @user = current_user.user.find_by(id: params[:id])
  end
  
  def update
      if @tag.update(tags_params)
          flash[:success] = 'タグを編集しました'
      redirect_back(fallback_location: root_path)
      else
          flash.now[:danger] = 'タグは編集されませんでした'
      redirect_back(fallback_location: root_path)
      end
  end
  
  
  def destroy
    @tag.destroy
    flash[:success] = 'タグを削除しました'
    redirect_back(fallback_location: root_path)
  end
  
  private
  def tags_params
    params.require(:tag).permit(:name)
  end
  
  def correct_user  #編集するタグがユーザのタグか判定
    @tag = current_user.tags.find_by(id: params[:id])
    unless @tag
    redirect_back(fallback_location: root_path)
    end
  end
    
  
end
