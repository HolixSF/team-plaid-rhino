
  get '/responses/new' do
    erb :"/responses/new"
  end

  post '/responses' do
    @response = Response.new(params)

    if @response.save
      erb :"/questions/#{@question.id}"
    else
      @errors = @question.errors.full_messages
      erb :"/responses/new"
    end

  end

