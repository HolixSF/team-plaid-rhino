get '/questions' do
  @activities = Activity[session[:user_id]]
  @questions = Question.all
  erb :"questions/index"
end

get '/questions/new' do
  erb :'/questions/new'
end

post '/questions' do
  slug = params[:title].gsub(/\?.*/, '').split(" ").join("_")
  @question = Question.new(user_id: session[:user_id], title: params[:title], text: params[:text], slug: slug)
  if @question.save
    Slug[@question.slug] = @question.id.to_s
    Activity[session[:user_id]] = "Asked Question: #{params[:title]}"

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
  if id = Slug[params[:id]]
   @question = Question.find(id)
  else
    @question = Question.find(params[:id])
  end

  if @vote = Vote.find_by(vote_for: @question, user_id: session[:user_id])
    @vote_value = @vote.vote_value
  end

  erb :"/questions/show"
end
