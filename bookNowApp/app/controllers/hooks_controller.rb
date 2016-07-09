class HooksController < ApplicationController
	protect_from_forgery :except => :receiver

	## This controller will capture all webhook events
	## Hooks will initially be sent from Stripe
	## Hook events to consider:
	## When a user deauthorizes Materra
	## When a user signs up for a subscription

	## Check out http://stackoverflow.com/questions/9627580/stripe-webhook-on-rails

	def receiver
		data = JSON.parse(request.body.read)

		if(data["user_id"])

			stripe_params = {
				stripe_publishable_key: nil, 
				stripe_user_id: nil, 
				stripe_refresh_token: nil, 
				stripe_access_token: nil
			}

			if data["type"] = "account.application.deauthorized"
				@deauthorized_stripe_users = User.where(stripe_user_id: data["user_id"]).update_all(stripe_params)	
			end

			render status: 200

		else

			render status: 404

		end
	end
end


