module ControllerHelpers

  def authenticate(user)
    request.cookies[:auth_token] = user.auth_token
    request.host = "#{user.account.slug}.example.com"
  end

end

RSpec.configure do |config|
	config.include ControllerHelpers, :type => :controller
end