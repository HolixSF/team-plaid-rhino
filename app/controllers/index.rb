get '/' do
  erb :index
end

get '/sessions/new' do
  erb :login
end