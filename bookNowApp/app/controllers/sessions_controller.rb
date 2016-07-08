class SessionsController < ApplicationController
  before_action :prevent_login_signup, only: [:signup, :create, :login, :attempt_login]

  def index
  end

  def signup
    @user = User.new
  end

  def login
  end

  def create
    @user = User.create user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path
    else
      render :signup
    end
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.where(email: params[:email]).first
      if found_user && found_user.authenticate(params[:password])
        session[:user_id] = found_user.id
        redirect_to home_path
      else
        flash[:alert] = "email / password combination is invalid"
        redirect_to login_path
      end
    else
      flash[:alert] = "please enter email and password"
      redirect_to login_path
    end
  end

  def logout
    # session.clear
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :company_name,
      :first_name,
      :last_name,
      :avatar_url
    )
  end
end
