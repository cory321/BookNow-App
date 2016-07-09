class FinancesController < ApplicationController
	
	before_action :confirm_logged_in
	
  def index

  	# Should We Display a Stripe Connect Button?
  	current_user.stripe_user_id.nil? ? @stripe_connected = false : @stripe_connected = true
  	
  end

end
