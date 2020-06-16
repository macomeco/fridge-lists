class ToppagesController < ApplicationController
  def index
    if user_signed_in?
      #@things_deadline = current_user.things.select(:deadline).where(deadline: Date.today).size.to_s
      #flash[:success] = '期限が今日で切れるモノは'+@things_deadline+'コです' dateでリセットさせる　flagで一回のみ
    #検索  
      if params[:search].present? #もし検索ワードが入っていたら
        if params[:search][0,1] == '#'  #tag検索
          tag_search_id = current_user.tags.select('id').where('name LIKE ?',"%#{params[:search][1..(params[:search].size-1) ]}%").all.ids #同じ単語
          @search_things = current_user.things.joins(:tag).where(:tag_id => tag_search_id)
        else
          tag_search_id = current_user.tags.select('id').where('name LIKE ?',"%#{params[:search]}%").all.ids #同じ単語
          @search_things = current_user.things.where('content LIKE ?',"%#{params[:search]}%").or(current_user.things.where(:tag_id => tag_search_id)).order(deadline: :asc,id: :asc)
        end
      else
        @search_things = nil
      end
    #もの
      @thing = current_user.things.build
      @things = current_user.things.joins(:tag, :list).order(deadline: :asc,id: :asc)
    #タグ
      @tag = current_user.tags.build
      @tags = current_user.tags.joins(:user).select('name','id','user_id','updated_at').order(id: :desc)
    #リスト
      @list = current_user.lists.build
      @lists = current_user.lists.joins(:user).select('name','id','user_id','updated_at').order(id: :desc)
    #日付
      @today = Date.current
    end
  end
end