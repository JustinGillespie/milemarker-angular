json.array!(@users) do |user|
  json.extract! user, :id, :email, :full_name, :role_name
  json.url api_user_url(user)
end
