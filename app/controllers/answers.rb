get '/questions/:id/answers/new' do
  @question=Question.find(params[:id])
  erb :"/answers/_new"
end

post '/questions/:id/answers/new' do
  @answer = Answer.new(user_id: session[:user_id], question_id: params[:id], text: params[:text])
  @question=Question.find(params[:id])
  if @answer.save
    redirect "/questions/#{params[:id]}"
  else
    if @answer.errors
      @errors = []
      @answer.errors.full_messages.each do |error|
        @errors << error.split(' ')[1..-1].join(' ')
      end
    end
    erb :"/answers/_new"
  end
end
