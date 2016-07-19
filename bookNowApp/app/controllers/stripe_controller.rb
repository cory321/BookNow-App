class StripeController < ApplicationController
	before_action :confirm_logged_in

	def index
		# Should We Display a Stripe Connect Button?
		current_user.stripe_user_id.nil? ? @stripe_connected = false : @stripe_connected = true
	end

	def authorize
		#pre-fill user's info (optional except for scope)
		params = {
		     :scope => 'read_write',
		     'stripe_user[email]' => current_user.email,
		     'stripe_user[url]' => current_user.website || "",
		     'stripe_user[business_name]' => current_user.company_name,
		     'stripe_user[first_name]' => current_user.first_name,
		     'stripe_user[last_name]' => current_user.last_name
		   }

    # Redirect the user to the authorize_uri endpoint
    redirect_to client.auth_code.authorize_url(params)
	end

	def oauth_callback
		
		if(params[:error])
			@error_type = params[:error]
			@error_description = params[:error_description]

			redirect_to stripe_path, flash: {alert: @error_type + " - " + @error_description}
			
		else

			# Pull the authorization_code out of the response
			code = params[:code]

		  # Make a request to the access_token_uri endpoint to get an access_token
		  @response = client.auth_code.get_token(code, :params => {:scope => 'read_write'})
		  
		  # Use the access_token as you would a regular live-mode API key
		  @refresh_token = @response.refresh_token
		  @access_token = @response.token

		  stripe_options = {
				stripe_publishable_key: @response.params["stripe_publishable_key"], 
				stripe_user_id: @response.params["stripe_user_id"], 
				stripe_refresh_token: @refresh_token, 
				stripe_access_token: @access_token
		  }

			current_user.update(stripe_options)
		  
		  if current_user.save
		    redirect_to stripe_path, flash: {success: "You Are Now Successfully Connected With Stripe!"}
		  else
		    redirect_to stripe_path, flash: {alert: "Stripe Connection Failed"}
		  end

		  # @response.params["stripe_user_id"]
		  # @response.params["stripe_publishable_key"]
		  # @refresh_token
		  # @access_token

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
