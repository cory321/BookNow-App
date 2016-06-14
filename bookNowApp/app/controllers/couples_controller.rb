class CouplesController < ApplicationController
  def index
  	@couples = Couple.all
  	render :index
  end

  def show
  	@couple = Couple.find(params[:id])
  	@date = @couple.wedding_date
  end
end
