json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :username, :phone, :phone2, :address_line1, :address_line2, :post_town, :role_id
  json.url user_url(user, format: :json)
end
