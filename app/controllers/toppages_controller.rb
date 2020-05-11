class ToppagesController < ApplicationController
     
  def index

      if logged_in?
        
      #カラー
      
    #  @theme =  Colortheme.new(clr_main: "#9BC1BC", clr_sub: "#F4F1BB", clr_list_i: "#F49683", clr_list_ii: "#AEC59E", clr_font: "#5D576B")
      
    #ラムネ 
    #  @theme = Colortheme.new(clr_main: "#46b1c9", clr_sub: "#E2F2DA", clr_list_i: "#84c0c6", clr_list_ii: "#9fb7b9", clr_font: "#717570")
    
    #モノクロ  
    #  @theme = Colortheme.new(clr_main: "#262626", clr_sub: "#ebebeb", clr_list_i: "#7f7f7f", clr_list_ii: "#696969", clr_font: "#3f3f3f" ,clr_point:"#E57E7E")

    #クリームソーダ
      @theme = Colortheme.new(clr_main: "#72BF96", clr_sub: "#F9F9D1", clr_list_i: "#98B59C", clr_list_ii: "#96CCB2", clr_font: "#592C2C",clr_point:"#E57E7E")

    #なぞカラー
    #  @theme =  Colortheme.new(clr_main: "#7E9F98", clr_sub: "#F8F7C2", clr_list_i: "#F49683", clr_list_ii: "#9DB28E", clr_font: "#5D576B")
    
    #
      
      @theme.save
      #@theme = Colortheme.find_by(id: 56)
      
      if params[:search].present?   #もし検索ワードが入っていたら
        @search_things = current_user.things.where('content LIKE ?',"%#{params[:search]}%")
      else    #もし検索ワードが入っていなかったら全部ぶち込む→えらいことになるのでやめとく
        #@search_things = 'キーワードを入力してください'
      end       
      
      #もの
      @thing = current_user.things.build
      if params[:sort].present?
        @things = current_user.things.order(params[:sort]).order(id: :asc)#:deadline=>:asc
      else  #初期値はasc
        params[:sort] = 'deadline asc'
        @things = current_user.things.order(params[:sort]).order(id: :asc)
        
      end
      #タグ
      @tag = current_user.tags.build
      @tags = current_user.tags.select('name','id','user_id').order(id: :asc)

      #リスト
      @list = current_user.lists.build
      @lists = current_user.lists.select('name','id','user_id').order(id: :asc)

      @list_w = current_user.lists.select('user_id','id','name').where(user_id: current_user.id)
      @tag_w=  current_user.tags.select('user_id','id','name').where(user_id: current_user.id)
      
      @today = Date.today
      
      @test = current_user.things.select('list_id')
      
      end
  end
  


end