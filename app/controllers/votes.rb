post '/questions/:id/votes/new' do
  @question = Question.find(params[:id])
  Vote.create(user_id: session[:user_id], vote_for: @question, vote_value: params[:vote])
  redirect "/questions/#{params[:id]}"
end
