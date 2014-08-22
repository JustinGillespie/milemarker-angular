module Api
	class BaseController < ApplicationController

		before_filter :authorize

		private

		def authorize
	  	if current_user.nil? or current_user.account.slug != request.subdomain
	  		render nothing: true, status: :forbidden 
	  	end
		end

	end
end
