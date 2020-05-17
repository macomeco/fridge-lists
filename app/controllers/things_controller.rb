class ThingsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :update]
  
  def create
    test = things_params[:quantity].to_i
    @arr = []
    
    test.times do      
      @tng = current_user.things.build(things_params)
      @tng.deadline ||= Date.today
      @arr.push(@tng)
    end
  
    @arr.each do |t|
      if t.save
        flash[:success] = 'ものを追加しました'
      else
        flash[:error] = 'ものの追加に失敗しました'
      end
    end
   redirect_back(fallback_location: root_path)
  end
  
  def update
    if @thing.update(things_params)
      @thing.quantity ||= 1
      flash[:success] = 'ものを編集しました'
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = 'ものの編集に失敗しました'
      redirect_back(fallback_location: root_path)
    end
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
    unless @thing
    redirect_back(fallback_location: root_path)
    end
  end
  
end
