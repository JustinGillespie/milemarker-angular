class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def testing
  	return "adsfasdfsadf"
  end

	private

	def authorize #:doc:
	  redirect_to login_path if current_user.nil? or current_user.account.slug != request.subdomain
	end

	def super #:doc:
		redirect_to login_path if current_user.nil? or current_user.role != 0
	end


	helper_method :account

	def account #:doc:
	  @account ||= current_user.account
	end

	helper_method :current_user

	def current_user #:doc:
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
	end

end