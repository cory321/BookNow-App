class PackagesController < ApplicationController
  
  before_action :confirm_logged_in
  
	def index
		@packages = Package.all
		render :index
	end

	def show
		@package = Package.find(params[:id])
	end

end
