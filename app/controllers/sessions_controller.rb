class SessionsController < ApplicationController

	layout "public"

	def new
	end

	def create
	  user = User.find_by_email(params[:email])
	  if user && user.authenticate(params[:password])

			if params[:remember_me]
				cookies.permanent[:auth_token] = {
					:value => user.auth_token,
					:domain => Rails.application.config.base_url
				}
	    else
				cookies[:auth_token] = { 
					:value => user.auth_token,
					:domain => Rails.application.config.base_url
				}
			end
			
	    flash[:success] = "Successfully logged in."
	    redirect_to root_url(subdomain: user.account.slug)
	  else
	    flash.now.alert = "Email or password is invalid"
	    render "new"
	  end
	end

	def destroy
		cookies.delete :auth_token, :domain => Rails.application.config.base_url
	  redirect_to login_path, :notice => "Logged out!"
	end

end
