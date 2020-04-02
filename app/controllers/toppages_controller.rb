class ToppagesController < ApplicationController
  def index
      if logged_in?
      @tag = current_user.tags.build
      @tags = current_user.tags.order(id: :desc)
      end
      
  end
  
  
  

end
