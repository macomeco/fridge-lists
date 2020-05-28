class TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy, :update]
  
  def show
    @tag = current_user.tags.build
    @tags = current_user.tags.select('name','id','user_id','updated_at').order(id: :asc)
  end

  def create
    @tag = current_user.tags.build(tags_params)
    if @tag.save
      flash[:success] = 'タグを追加しました'
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = 'タグの追加に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  def update
      if @tag.update(tags_params)
        flash[:success] = 'タグを編集しました'
        redirect_back(fallback_location: root_path)
      else
        flash[:error] = 'タグは編集されませんでした'
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
