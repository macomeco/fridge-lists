class TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy, :update]
  
  def show
    @tag = current_user.tags.build
    @tags = current_user.tags.select('name','id','user_id','updated_at').order(id: :desc)
  end

  def create
    @tag = current_user.tags.build(tags_params)
    if @tag.save
      flash[:success] = @tag.name.to_s + 'を追加しました'
    else
      flash[:error] = 'タグの追加に失敗しました'
    end
    @lists = current_user.lists.joins(:user).select('name','id','user_id','updated_at').order(id: :desc)
    @tags = current_user.tags.joins(:user).select('name','id','user_id','updated_at').order(id: :desc)
  end

  def update
    if @tag.update(tags_params)
      flash[:success] = @tag.name.to_s + 'を編集しました'
      #    redirect_back(fallback_location: root_path)
    else
      flash[:error] = @tag.name.to_s + 'の編集に失敗しました'
    end
    @things = current_user.things.joins(:tag, :list).order(deadline: :asc,id: :desc)
    @lists = current_user.lists.joins(:user).select('name','id','user_id','updated_at').order(id: :desc)
    @tags = current_user.tags.joins(:user).select('name','id','user_id','updated_at').order(id: :desc)
  end
  
  def destroy
    @tag.destroy
    flash[:success] = 'タグを削除しました'
    @lists = current_user.lists.joins(:user).select('name','id','user_id','updated_at').order(id: :desc)
    @tags = current_user.tags.joins(:user).select('name','id','user_id','updated_at').order(id: :desc)
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
