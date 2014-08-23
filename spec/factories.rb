FactoryGirl.define do
	
	factory :user do
		sequence(:id) { |n| n + 1 }
		sequence(:email) { |n| "test-user#{n}@example.com" }
		first_name "Justin"
		last_name "Gillespie"
		password "secret"
		password_confirmation "secret"
		role 2
		account
	end

	factory :account do
		name "My Company"
		slug "my-company"
	end

end