class CouplesController < ApplicationController
  def index
  	@couples = Couple.all
  	render :index
  end

  def show
  	@couple = Couple.find(params[:id])
  end
end
