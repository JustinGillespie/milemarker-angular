json.array!(@users) do |user|
  json.extract! user, :id, :email, :first_name, :last_name, :full_name, :role_name
  json.image user.image_url(:thumb)
  json.url api_user_url(user)
end
