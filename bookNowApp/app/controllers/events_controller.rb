class EventsController < ApplicationController
  before_action :set_user, only: [:index, :new, :create]
  before_action :confirm_logged_in
  before_action :ensure_correct_user_for_event, only: [:edit, :show, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = @user.events
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    def set_user
      @user = User.find params[:user_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :start_time, :end_time, :all_day)
    end

    def ensure_correct_user_for_assistant

      ## FIX THIS LOGIC
      assistant = Assistant.find params[:id]
      unless couple.user.id == session[:user_id]
        redirect_to user_assistants_path(current_user), alert: "Invalid Request"
      end
      # find which user made the team with params[:id]
      # compare that user's id against current_user.id
      # if they do not match up, redirect with a mean message
    end
end
