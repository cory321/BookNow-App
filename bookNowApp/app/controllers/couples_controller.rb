class CouplesController < ApplicationController
  before_action :set_user, only: [:index, :new, :create]
  before_action :confirm_logged_in
  before_action :ensure_correct_user_for_couple, only: [:edit, :show, :update, :destroy]
  
  def index
  	@couples = @user.couples
  	render :index
  end

  def new
    @couple = Couple.new
  end

  def create
  	@couple = @user.couples.create couple_params
  	if @couple.save
  		redirect_to user_couples_path(@user), flash: {success: "#{@couple.groom_first_name} and #{@couple.bride_first_name} added!"}
  	else
  		render :new
  	end
  end

  def show
  	@couple = Couple.find(params[:id])
  	@date = @couple.wedding_date
  end

  private

	def couple_params
		params.require(:couple).permit(:wedding_date, :groom_first_name, :groom_last_name, :groom_phone, :groom_email, :bride_first_name, :bride_last_name, :bride_phone, :bride_email, :planner_first_name, :planner_last_name, :planner_phone, :planner_email, :groom_location_gr, :bride_location_gr, :ceremony_address, :reception_address, :marital_address)
	end

  def set_user
    @user = User.find params[:user_id]
  end

  def ensure_correct_user_for_couple
    couple = Couple.find params[:id]
    unless couple.user.id == session[:user_id]
      redirect_to user_couples_path(current_user), alert: "Not authorized"
    end
    # find which user made the team with params[:id]
    # compare that user's id against current_user.id
    # if they do not match up, redirect with a mean message
  end

end
