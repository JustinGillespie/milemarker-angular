FactoryGirl.define do
	
	factory :user do
		sequence(:id) { |n| n + 1 }
		sequence(:email) { |n| "test-user#{n}@example.com" }
		password  "secret"
		password_confirmation "secret"
		account
	end

	factory :account do
		name "My Company"
		slug "my-company"
	end

end