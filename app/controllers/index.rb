get '/' do
  redirect '/questions'
end

get '/sessions/new' do
  erb :login
end
