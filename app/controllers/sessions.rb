post '/sessions/new' do
  if user = User.authenticate(username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @error = "Invalid username or password. Please try again."
    erb :"users/login"
  end
end

get '/sessions/new' do
  erb :"users/login"
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
