module Api
	module V1
    class UsersController < Api::BaseController
			  		
  		def index
  			@users = account.users.order(last_name: :asc)
  		end

			def edit
				@user = current_user
			end

		end #UsersController
  end # V1
end # Api
