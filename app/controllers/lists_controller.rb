class ListsController < ApplicationController
  #before_action :require_user_logged_in
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy, :update]

  def show
    @list = current_user.lists.build
    @lists = current_user.lists.select('name','id','user_id','updated_at').order(id: :asc)
  end

  def create
    @list = current_user.lists.build(lists_params)
    if @list.save
      flash[:success] = @list.name.to_s + 'を追加しました'
      #redirect_back(fallback_location: root_path)
    else
      flash[:error] = 'お部屋の追加に失敗しました'
      #redirect_back(fallback_location: root_path)
    end
    @lists = current_user.lists.joins(:user).select('name','id','user_id','updated_at').order(id: :desc)
    @tags = current_user.tags.joins(:user).select('name','id','user_id','updated_at').order(id: :desc)
    @things = current_user.things.joins(:tag, :list).order(deadline: :asc)

  end

  def update
    if @list.update(lists_params)
        flash[:success] = @list.name.to_s + 'を編集しました'
    else
        flash[:error] = @list.name.to_s + 'の編集に失敗しました'
    end
    @lists = current_user.lists.joins(:user).select('name','id','user_id','updated_at').order(id: :desc)
    @tags = current_user.tags.joins(:user).select('name','id','user_id','updated_at').order(id: :desc)
  end
  
  def destroy
    @list.destroy
    flash[:success] = 'お部屋を削除しました'
    @lists = current_user.lists.joins(:user).select('name','id','user_id','updated_at').order(id: :desc)
    @tags = current_user.tags.joins(:user).select('name','id','user_id','updated_at').order(id: :desc)
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
