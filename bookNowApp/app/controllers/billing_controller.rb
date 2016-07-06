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

  	access_code = params[:code]
    secret_key = ENV['STRIPE_SECRET_KEY']

    customer = ActiveSupport::JSON.decode(`curl -X POST https://connect.stripe.com/oauth/token -d client_secret=#{secret_key} -d code=#{access_code} -d grant_type=authorization_code`)

    @stripe_user_id = customer['stripe_user_id']

    render "confirmed"

		# uri = "https://stripe.com/connect/default/oauth/test?scope=read_write&code=" + access_code
  	
  # 	# response = Net::HTTP.get(URI.parse(uri))	
  # 	# hash = JSON.parse(response)

  #   binding.pry

    # http = Net::HTTP.new(uri.host, uri.port)
    # http.use_ssl = true

    # request = Net::HTTP::Post.new(uri.path, {'Content-Type' =>'application/json'})
    # request.body = data.to_json

    # response = http.request(request)
  	
  	# @name = hash['name']

  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
