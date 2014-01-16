class HistoriesController < ApplicationController
  def index
    @histories=History.all
    
    respond_to do |format|
    format.any{render json: @histories }
  end
  #end
  end
  
end
