# Leave comment for questions

get '/questions/:id/responses/new' do
  @question = Question.find(params[:id])
  erb :"responses/_new_to_question", layout: false
end

post '/questions/:id/responses' do
  @question = Question.find(params[:id])
  response = Response.new(user_id: session[:user_id], text: params[:text], response_to: @question)

  if response.save
    redirect "/questions/#{@question.id}"
  else
    @errors = response.errors.full_messages
    erb :"/responses/_new_to_question"
  end

end

# Leave comment for answers

get '/questions/:q_id/answers/:r_id/responses/new' do
  @question = Question.find(params[:q_id])
  @answer = Answer.find(params[:r_id])
  if request.xhr?
    erb :"/responses/_new_to_answer", layout: false, locals: {question: @question, answer: @answer}
  else
    redirect "/questions/#{@question.id}"
  end
end

post '/questions/:q_id/answers/:r_id/responses' do
  @question = Question.find(params[:q_id])
  @answer = Answer.find(params[:r_id])
  response = Response.new(user_id: session[:user_id], text: params[:text], response_to: @answer)

  if response.save
    redirect "/questions/#{@question.id}"
  else
    @errors = response.errors.full_messages
    erb :"/responses/_new_to_question"
  end

end
