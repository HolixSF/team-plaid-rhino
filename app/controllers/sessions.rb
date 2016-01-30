post '/sessions/new' do
  user = User.authenticate(username: params[:username], password: params[:password])
  session[:user_id] = user.id  if user
  redirect '/'
end

post '/logout' do
  session[:user_id] = nil
  redirect '/'
end
