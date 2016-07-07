class StripeController < ApplicationController

	def index

		 # binding.pry
		
	end

	def authorize
		params = {
		     :scope => 'read_write'
		     #pre-fill user's info (optional)
		     # 'stripe_user[email]' => 'me@bettycrocker.com',
		     # 'stripe_user[url]' => 'https://dessertmarket.com/betty-crocker',
		     # 'stripe_user[first_name]' => 'Betty',
		     # 'stripe_user[last_name]' => 'Crocker'
		   }

    # Redirect the user to the authorize_uri endpoint
    redirect_to client.auth_code.authorize_url(params)
	end

	def oauth_callback
		
		if(params[:error])

			@error_type = params[:error]
			@error_description = params[:error_description]

			render :index
			
		else
			
			# Pull the authorization_code out of the response
			code = params[:code]

		  # Make a request to the access_token_uri endpoint to get an access_token
		  @response = client.auth_code.get_token(code, :params => {:scope => 'read_write'})
		  
		  # Use the access_token as you would a regular live-mode API key
		  @access_token = @response.token

		  render :index

		  # @response.params["stripe_user_id"]
		  # TODO: Stripe logic
		end
	end



	private
	
	# Configuration Settings
	def options
		@options = {
		  :site => 'https://connect.stripe.com',
		  :authorize_url => '/oauth/authorize',
		  :token_url => '/oauth/token'
		}
	end

	def client
		@client ||= OAuth2::Client.new(ENV['STRIPE_CONNECT_CLIENT_ID'], ENV['STRIPE_SECRET_KEY'], options)
	end


end
