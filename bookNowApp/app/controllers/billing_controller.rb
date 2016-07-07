class BillingController < ApplicationController
  before_action :confirm_logged_in
  #ensure correct user for billing

	def index

	end


  def connect

    # @auth_hash = auth_hash
    # binding.pry

  end

  def confirm

  	# access_code = params[:code]
   #  secret_key = ENV['STRIPE_SECRET_KEY']

   #  customer = ActiveSupport::JSON.decode(`curl -X POST https://connect.stripe.com/oauth/token -d client_secret=#{secret_key} -d code=#{access_code} -d grant_type=authorization_code`)

   #  @stripe_user_id = customer['stripe_user_id']

   #  render "confirmed"

  end

  protected

  # def auth_hash
  #   request.env['omniauth.auth']
  # end

end
