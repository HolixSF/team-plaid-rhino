post '/questions/:id/votes/new' do
  @question = Question.find(params[:id])
  if !Vote.find_by(vote_for: @question, user_id: session[:user_id])
    Vote.create(user_id: session[:user_id], vote_for: @question, vote_value: params[:vote])
  end
  redirect "/questions/#{params[:id]}"
end

post '/questions/:q_id/responses/:r_id/votes/new' do
  response = Response.find(params[:r_id])
  if !Vote.find_by(vote_for: response, user_id: session[:user_id])
    Vote.create(user_id: session[:user_id], vote_for: response, vote_value: params[:vote])
  end
  redirect "/questions/#{params[:q_id]}"
end

post '/questions/:q_id/answers/:a_id/votes/new' do
  answer = Answer.find(params[:a_id])
  if !Vote.find_by(vote_for: answer, user_id: session[:user_id])
    Vote.create(user_id: session[:user_id], vote_for: answer, vote_value: params[:vote])
  end
  redirect "/questions/#{params[:q_id]}"
end

post '/questions/:q_id/answers/:a_id/responses/:r_id/votes/new' do
  response = Response.find(params[:r_id])
  if !Vote.find_by(vote_for: response, user_id: session[:user_id])
    Vote.create(user_id: session[:user_id], vote_for: response, vote_value: params[:vote])
  end
  redirect "/questions/#{params[:q_id]}"
end

