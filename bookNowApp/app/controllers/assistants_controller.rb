class AssistantsController < ApplicationController
	def index
		@assistants = Assistant.all
		render :index
	end

	def show
		@assistant = Assistant.find(params[:id])
	end
end
