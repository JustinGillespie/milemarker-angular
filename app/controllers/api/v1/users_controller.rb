module Api
	module V1
    class UsersController < Api::BaseController
			  		
  		def index
  			@users = account.users.all
  		end

			def edit
				@user = current_user
			end

      def show
        @user = account.users.find(params[:id])
      end

			def create
     		@user = account.users.build(user_params)
        @user.role = ([2, 3, 4].include? @user.role) ? @user.role : 3
        render(:json => { :errors => @user.errors.full_messages }, :status => 422) if !@user.save
      end

      def update
        @user = current_user
        render(:json => { :errors => @user.errors.full_messages }, :status => 422) if !@user.update(user_params)
      end

      def destroy
        @user = account.users.find(params[:id])
        @response = { success: false, message: "There was a problem with your request. Please try again later." }

        if @user.destroy
          @response[:success] = true
          @response[:message] = "#{@user.full_name} was successfully removed."
        end
      end

    private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :full_name, :image)
      end

		end #UsersController
  end # V1
end # Api
