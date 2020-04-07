class ThingsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :edit, :update]
  
  def create
    @thing = current_user.things.build(things_params)
    if @thing.save
      flash[:success] = 'ものを追加しました'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:success] = 'ものの追加に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @thing.destroy
    flash[:success] = '削除しました'
    redirect_back(fallback_location: root_path)
  end
  
  private
  def things_params
    params.require(:thing).permit(:list_id, :content, :deadline,:tag_id, :quantity)
  end
  
  def correct_user  #編集するタグがユーザのタグか判定
    @thing = current_user.things.find_by(id: params[:id])
    unless @tihng
    redirect_back(fallback_location: root_path)
    end
  end
  
end
