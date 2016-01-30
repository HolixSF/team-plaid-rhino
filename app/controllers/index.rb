get '/' do
  erb :index
end

get '/questions' do
  erb :index
end

get '/questions/:id' do
  @id = params[:id]
  erb :"questions/view"
end

get '/sessions/new' do
  erb :login
end

get '/questions/new' do
  erb :"questions/new"
end

post '/questions/new' do
  erb :index
end
