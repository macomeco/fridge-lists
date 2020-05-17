class ToppagesController < ApplicationController
     
  def index
    @user = User.new
    if logged_in?
      
      #@things_deadline = current_user.things.select(:deadline).where(deadline: Date.today).size.to_s
      #flash[:success] = '期限が今日で切れるモノは'+@things_deadline+'コです'
      
      #初期値はラムネ
      @set = current_user.theme
      instance_variable_set('@theme',$sodapop )
      
      if @set == nil  || @set == 'sodapop' then
          instance_variable_set('@theme',$sodapop )
        elsif @set == 'melon'
          instance_variable_set('@theme',$melon )
        elsif @set == 'mono'
          instance_variable_set('@theme',$mono )
        elsif @set == 'cake'
          instance_variable_set('@theme',$cake )
      end  
      
      if params[:search].present? #もし検索ワードが入っていたら
        @search_things = current_user.things.where('content LIKE ?',"%#{params[:search]}%")
        @tag_search_id = current_user.tags.select('id').where('name LIKE ?',"%#{params[:search]}%").all.ids #同じ単語
        @search_things += current_user.things.where(:tag_id => @tag_search_id)
      else    #もし検索ワードが入っていなかったら全部ぶち込む→えらいことになるのでやめとく
        @search_things = nil
      end       
      
      #もの
      @thing = current_user.things.build
      @things = current_user.things.order(deadline: :desc).order(id: :asc)
      
      #タグ
      @tag = current_user.tags.build
      @tags = current_user.tags.select('name','id','user_id','updated_at').order(id: :asc)

      #リスト
      @list = current_user.lists.build
      @lists = current_user.lists.select('name','id','user_id','updated_at').order(id: :asc)

      @list_w = current_user.lists.select('user_id','id','name').where(user_id: current_user.id)
      @tag_w=  current_user.tags.select('user_id','id','name').where(user_id: current_user.id)
      
      @today = Date.today
      
      @test = current_user.things.select('list_id')
    end
  end
end