json.array!(@users) do |user|
  json.extract! user, :name, :email, :password, :remember_token
  json.url user_url(user, format: :json)
end
