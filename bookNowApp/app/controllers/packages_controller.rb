class PackagesController < ApplicationController
	def index
		@packages = Package.all
		render :index
	end

	def show
		@package = Package.find(params[:id])
	end

end
