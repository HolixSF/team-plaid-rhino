get '/' do
  redirect '/questions'
end

get '/questions' do
  @questions=Question.all
  erb :index
end


get '/sessions/new' do
  erb :login
end


post '/questions/new' do
  erb :index
end
