get '/questions' do
  @questions = Question.all
  erb :"questions/index"
end

get '/questions/new' do
  erb :'/questions/new'
end

post '/questions' do
  @question = Question.new(user_id: session[:user_id], title: params[:title], text: params[:text])
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    if @question.errors
      @errors = []
      @question.errors.full_messages.each do |error|
        @errors << error.split(' ')[1..-1].join(' ')
      end
    end
    erb :'/questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @vote_total = @question.votes.map(&:vote_value).reduce(:+)
  erb :"/questions/show"
end
