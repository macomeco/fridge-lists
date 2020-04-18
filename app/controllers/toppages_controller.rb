class ToppagesController < ApplicationController
  def index
      if logged_in?
      
      #もの
      @thing = current_user.things.build
      @things = current_user.things.order(params[:sort]) #:deadline=>:asc,:id=>:desc
      
      #タグ
      @tag = current_user.tags.build
      @tags = current_user.tags.order(id: :asc)

      #リスト
      @list = current_user.lists.build
      @lists = current_user.lists.order(id: :asc)
      
      end
  end
end
