class CouplesController < ApplicationController
  before_action :set_user, only: [:index, :new, :create]
  before_action :confirm_logged_in
  before_action :ensure_correct_user_for_couple, only: [:edit, :show, :update, :destroy]
  before_filter :modified_couple_params, only: :create

  def index

  	@couples = @user.couples.order('wedding_date DESC')

    starting_year = @couples.first.wedding_date.year #2019
    ending_year = @couples.last.wedding_date.year #2014
    num_years = starting_year - ending_year #2
    
    years_array = [[]]
    i = 0

    until i > num_years

    years_array.push []
      @couples.each do |couple|
        if couple.wedding_date.year == starting_year
          years_array[i].push couple
        end
      end

      i = i+1
      starting_year = starting_year-1
    end

    @years = years_array

  	render :index
  end

  def new
    @couple = Couple.new
  end

  def create

    @couple = @user.couples.create modified_couple_params
    
    @event = Event.new
    @event.title = couple_params[:groom_first_name] + " and " + couple_params[:bride_first_name]
    @event.description = couple_params[:ceremony_address]
    @event.start_time = modified_couple_params[:wedding_date]
    @event.end_time = modified_couple_params[:wedding_date]
    @event.all_day = true
    @event.event_type = "Wedding"
    @event.user_id =  @couple.user.id
    @event.couple_id = @couple.id

  	if @couple.save && @event.save
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

  def modified_couple_params
    new_hash = couple_params
    date = couple_params[:wedding_date] + " 12:00:00"
    new_date = DateTime.strptime(date, '%m/%d/%Y %H:%M:%S')
    new_hash[:wedding_date] = new_date
    return new_hash
  end

	def couple_params
		params.require(:couple).permit(:wedding_date, :groom_first_name, :groom_last_name, :groom_phone, :groom_email, :bride_first_name, :bride_last_name, :bride_phone, :bride_email, :planner_first_name, :planner_last_name, :planner_phone, :planner_email, :groom_location_gr, :bride_location_gr, :ceremony_address, :reception_address, :marital_address)
	end

  def set_user
    @user = User.find params[:user_id]
  end

  def ensure_correct_user_for_couple
    ## FIX THIS LOGIC
    couple = Couple.find params[:id]
    unless couple.user.id == session[:user_id]
      redirect_to user_couples_path(current_user), alert: "Not authorized"
    end
    # find which user made the team with params[:id]
    # compare that user's id against current_user.id
    # if they do not match up, redirect with a mean message
  end

end
