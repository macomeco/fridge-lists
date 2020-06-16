class ThingsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy, :update]
  before_action :for_js, only: [:create, :update, :destroy]
  
  def create
    test = things_params[:quantity].to_i
    @tng_list = things_params[:list_id].to_i
    @arr = []
    test.times do      
      @tng = current_user.things.build(things_params)
      @tng.deadline ||= Date.today
      @arr.push(@tng)
    end
    @arr.each do |t|
      if t.save
        flash[:success] = t.content.to_s + 'を追加しました'
      else
        flash[:error] = 'ものの追加に失敗しました'
      end
    end
    @no = current_user.things.where(list_id: @tng_list).to_a.size 
  end

  def update
    if @thing.update(things_params)
      @thing.quantity ||= 1
      flash[:success] = @thing.content.to_s + 'を編集しました'
    else
      flash[:error] = @thing.content.to_s + 'の編集に失敗しました'
      redirect_back(fallback_location: root_path)
    end
    @no = current_user.things.where(list_id: @thing.list_id).to_a.size 
  end
  
  def destroy
    @thing.destroy
    flash[:success] = '削除しました'
    
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
  
  def tngs_js
    current_user.things.joins(:tag, :list).order(deadline: :asc,id: :desc)
  end
  
  def for_js
    @today = Date.current
    @things = current_user.things.joins(:tag, :list).order(deadline: :asc,id: :asc)
    @lists = current_user.lists.joins(:user).select('name','id','user_id','updated_at').order(id: :desc)
    @tags = current_user.tags.joins(:user).select('name','id','user_id','updated_at').order(id: :desc)
  end
  
end
