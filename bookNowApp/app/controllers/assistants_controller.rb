class AssistantsController < ApplicationController

	before_action :confirm_logged_in

	def index
		@assistants = Assistant.all
		render :index
	end

	def create
		@assistant = Assistant.new(assistant_params)
		if @assistant.save
			redirect_to assistants_path
		else
			render :new
		end
	end

	def new
		@assistant = Assistant.new
	end

	def show
		@assistant = Assistant.find(params[:id])
	end

	private

	def assistant_params
		params.require(:assistant).permit(:first_name, :last_name, :phone, :email, :avatar, :city)
	end
end
