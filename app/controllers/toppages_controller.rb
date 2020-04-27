class ToppagesController < ApplicationController
     
  def index

      if logged_in?
        
      #カラー
      
    #  @theme =  Colortheme.new(clr_main: "#9BC1BC", clr_sub: "#F4F1BB", clr_list_i: "#F49683", clr_list_ii: "#AEC59E", clr_font: "#5D576B")
      
      
    #  @theme = Colortheme.new(clr_main: "#46b1c9", clr_sub: "#f2e2d2", clr_list_i: "#84c0c6", clr_list_ii: "#9fb7b9", clr_font: "#717570")
      
      @theme = Colortheme.new(clr_main: "#262626", clr_sub: "#ebebeb", clr_list_i: "#7f7f7f", clr_list_ii: "#696969", clr_font: "#3f3f3f")

    #  @theme = Colortheme.new(clr_main: "#61988E", clr_sub: "#f0eaf2", clr_list_i: "#BEDFC3", clr_list_ii: "#8FC0A9", clr_font: "#493843")


    #  @theme =  Colortheme.new(clr_main: "#9BC1BC", clr_sub: "#F4F1BB", clr_list_i: "#F49683", clr_list_ii: "#AEC59E", clr_font: "#5D576B")
      
      
      
      
      
      @theme.save
      
      #@theme = Colortheme.find_by(id: 56)
      

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