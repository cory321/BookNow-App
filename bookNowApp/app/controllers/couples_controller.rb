class CouplesController < ApplicationController
  before_action :set_couple, only: [:show, :edit, :update, :destroy]

  # GET /couples
  # GET /couples.json
  def index
    @couples = Couple.all
  end

  # GET /couples/1
  # GET /couples/1.json
  def show
  end

  # GET /couples/new
  def new
    @couple = Couple.new
  end

  # GET /couples/1/edit
  def edit
  end

  # POST /couples
  # POST /couples.json
  def create
    @couple = Couple.new(couple_params)

    respond_to do |format|
      if @couple.save
        format.html { redirect_to @couple, notice: 'Couple was successfully created.' }
        format.json { render :show, status: :created, location: @couple }
      else
        format.html { render :new }
        format.json { render json: @couple.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /couples/1
  # PATCH/PUT /couples/1.json
  def update
    respond_to do |format|
      if @couple.update(couple_params)
        format.html { redirect_to @couple, notice: 'Couple was successfully updated.' }
        format.json { render :show, status: :ok, location: @couple }
      else
        format.html { render :edit }
        format.json { render json: @couple.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /couples/1
  # DELETE /couples/1.json
  def destroy
    @couple.destroy
    respond_to do |format|
      format.html { redirect_to couples_url, notice: 'Couple was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_couple
      @couple = Couple.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def couple_params
      params.require(:couple).permit(:wedding_date, :groom_first_name, :groom_last_name, :groom_email, :groom_phone, :groom_location_gr, :bride_first_name, :bride_last_name, :bride_email, :bride_phone, :bride_location_gr, :planner_first_name, :planner_last_name, :planner_email, :planner_phone)
    end
end
