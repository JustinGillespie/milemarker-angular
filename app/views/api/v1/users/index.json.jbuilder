json.array!(@users) do |user|
  json.extract! user, :id, :email
  json.url api_user_url(user)
end
