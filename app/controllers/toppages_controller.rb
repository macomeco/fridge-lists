class ToppagesController < ApplicationController
  def index
      if logged_in?
      
      #カラー
      @theme = Colortheme.find_by(id: 1)
      
      if params[:search].present?
        @search_things = current_user.things.where('content LIKE ?',"%#{params[:search]}%")
      else
        @search_things = nil
      end       
      
      #もの
      @thing = current_user.things.build
      if params[:sort].present?
        @things = current_user.things.order(params[:sort]).order(id: :asc)#:deadline=>:asc
      else
        params[:sort] = 'deadline asc'
        @things = current_user.things.order(params[:sort]).order(id: :asc)
        
      end
      #タグ
      @tag = current_user.tags.build
      @tags = current_user.tags.order(id: :asc)

      #リスト
      @list = current_user.lists.build
      @lists = current_user.lists.order(id: :asc)
      

      end
  end
end
