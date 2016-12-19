json.extract! user, :id, :first_name, :last_name, :age, :location, :email, :gender, :description, :image, :created_at, :updated_at
json.url user_url(user, format: :json)