
  get '/questions/:id/responses/new' do
    @question = Question.find(params[:id])
    erb :"responses/_new_to_question"
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

