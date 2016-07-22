class ItemsController < ApplicationController
before_action :set_package, only: :create
before_action :set_user, only: :create
before_action :confirm_logged_in

def create
	@items = @package.items.create(item_params)
	if @items.save
		redirect_to user_packages_path(current_user)
	end
end

private

def item_params
	params.require(:item).permit(:name)
end

def set_user
  @user = User.find session[:user_id]
end

def set_package
	@user = User.find session[:user_id]
  @package = @user.packages.find params[:package_id]
end

end
