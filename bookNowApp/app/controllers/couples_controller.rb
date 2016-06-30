class CouplesController < ApplicationController

  before_action :confirm_logged_in
  
  def index
  	@couples = Couple.all
  	render :index
  end

  def create
  	@couple = Couple.new(couple_params)
  	if @couple.save
  		redirect_to couples_path
  	else
  		render :new
  	end
  end

  def show
  	@couple = Couple.find(params[:id])
  	@date = @couple.wedding_date
  end

	def new
		@couple = Couple.new
	end

	def couple_params
		params.require(:couple).permit(:wedding_date, :groom_first_name, :groom_last_name, :groom_phone, :groom_email, :bride_first_name, :bride_last_name, :bride_phone, :bride_email, :planner_first_name, :planner_last_name, :planner_phone, :planner_email, :groom_location_gr, :bride_location_gr, :ceremony_address, :reception_address, :marital_address)
	end

end
