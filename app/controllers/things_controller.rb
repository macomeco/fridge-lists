class ThingsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :update]
  
  
  def create
    #@thing = current_user.things.build(things_params)
    test = things_params[:quantity].to_i
    @arr = []
    
    test.times do      
      @arr.push(current_user.things.build(things_params))
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
    if @thing.update(things_params_ii)
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
  
  def things_params_ii
    params.require(:thing).permit(:list_id, :content, :deadline,:tag_id, quantity: 1)
  end
  
  def correct_user  #編集するタグがユーザのタグか判定
    @thing = current_user.things.find_by(id: params[:id])
    unless @thing
    redirect_back(fallback_location: root_path)
    end
  end
  
end
