# Index

# Show

# New
get '/users/new' do
  erb :new_user
end

# Create
post '/users' do

  erb :index
  # user = User.create(
  #   first_name: params[:first_name],
  #   last_name: params[:last_name],
  #   email: params[:email],
  #   password: params[:password])
  # session[:user_id] = user.id

  # # See README_Controllers for why we use the Post/Redirect/Get Pattern
  # # instead of rendering a View in a post request
  # redirect to '/users/#{user.id}'
end

# Edit

# Update

# Delete
