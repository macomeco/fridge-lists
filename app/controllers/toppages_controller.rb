class ToppagesController < ApplicationController
  def index
      if logged_in?
        
      if params[:search].present?
        @search_things = current_user.things.where('content LIKE ?',"%#{params[:search]}%")
      else
        @search_things = nil
      end      
      
      #もの
      @thing = current_user.things.build
      @things = current_user.things.order(params[:sort]).order(id: :asc)#:deadline=>:asc
  
      #タグ
      @tag = current_user.tags.build
      @tags = current_user.tags.order(id: :asc)

      #リスト
      @list = current_user.lists.build
      @lists = current_user.lists.order(id: :asc)
      
      end
  end
end
