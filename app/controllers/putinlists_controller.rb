class PutinlistsController < ApplicationController
  def create
    @thing = Thing.find(params[:thing_id])
    @list = List.find(params[:list_id])
    @thing.list_in(@list)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @thing = Thing.find(params[:thing_id])
    @list = List.find(@arams[:list_id])
    
  end
end
