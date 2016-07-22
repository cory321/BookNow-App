class PackagesController < ApplicationController
	before_action :set_user, only: [:index, :new, :create]
	before_action :confirm_logged_in
	before_action :ensure_correct_user_for_package, only: [:edit, :show, :update, :destroy]
  
	def index
		@packages = @user.packages
	end

	def new
		@package = @user.packages.new
	end

	def create
		@package = @user.packages.create package_params
			
			if @package.save
				redirect_to user_packages_path(current_user)
			else
				redirect_to user_packages_path(current_user), flash: {alert: "Error: Your package was not created"}
			end
	end

	def show
		@package = Package.find(params[:id])
	end

	private

	def package_params
		params.require(:package).permit(:name, :price)
	end

	def set_user
	  @user = User.find session[:user_id]
	end

	def ensure_correct_user_for_package

	  ## FIX THIS LOGIC
	  package = Package.find params[:id]
	  unless package.user.id == session[:user_id]
	    redirect_to user_packages_path(current_user), alert: "Invalid Request"
	  end
	  # find which user made the team with params[:id]
	  # compare that user's id against current_user.id
	  # if they do not match up, redirect with a mean message
	end

end
