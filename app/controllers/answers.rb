get '/questions/:id/answers/new' do
  @question=Question.find(params[:id])
  if request.xhr?
      erb :'/answers/_new_answer_form', layout: false, locals: {question: @question}
  else
      erb :"/answers/_new"
  end
end

post '/questions/:id/answers/new' do
  @answer = Answer.new(user_id: session[:user_id], question_id: params[:id], text: params[:text])
  @question = Question.find(params[:id])
  if @answer.save
    # if request.xhr?

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

put '/questions/:id/answers/:answer_id' do
  answersToQuestion = Answer.where(question_id: params[:id])
  oldTopAnswer = answersToQuestion.find_by(best_answer: true)
  oldTopAnswer.update(best_answer: false) if oldTopAnswer
  newTopAnswer = Answer.find(params[:answer_id])
  newTopAnswer.update(best_answer: true)
  redirect "/questions/#{params[:id]}"
end
