class AssistantsController < ApplicationController
	before_action :set_user, only: [:index, :new, :create]
	before_action :confirm_logged_in
	before_action :ensure_correct_user_for_assistant, only: [:edit, :show, :crop_avatar, :update, :destroy]

	def index
		@assistants = @user.assistants
	end

	def new
		@assistant = Assistant.new
	end

	def create
		@assistant = @user.assistants.create assistant_params
		if @assistant.save
			if assistant_params[:avatar]
				redirect_to assistants_crop_avatar_path(@assistant)
			else
				redirect_to user_assistants_path(@user), flash: {success: "Your assistant has been added"}
			end
		else
			render :new, flash: {alert: "An error occurred"}
		end
	end

	def crop_avatar
		@assistant = Assistant.find(params[:id])

	end

	def show
		@assistant = Assistant.find(params[:id])
	end

	private

	def assistant_params
		params.require(:assistant).permit(:first_name, :last_name, :phone, :email, :avatar, :city)
	end

	def set_user
	  @user = User.find params[:user_id]
	end

	def ensure_correct_user_for_assistant

	  ## FIX THIS LOGIC
	  assistant = Assistant.find params[:id]
	  unless  assistant.user.id == session[:user_id]
	    redirect_to user_assistants_path(current_user), alert: "Invalid Request"
	  end
	  # find which user made the team with params[:id]
	  # compare that user's id against current_user.id
	  # if they do not match up, redirect with a mean message
	end
end
