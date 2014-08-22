class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	private

	def authorize
	  redirect_to login_path if current_user.nil? or current_user.account.slug != request.subdomain
	end

	helper_method :account

	def account
	  @account ||= current_user.account
	end

	helper_method :current_user

	def current_user
	  @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
	end

end
