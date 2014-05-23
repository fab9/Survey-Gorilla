get '/' do
  # Look in app/views/index.erb
  @surveys = Survey.all
  erb :index
end

post '/sessions/new' do
  if User.authenticate(params[:email], params[:password])
    @user = User.find_by_email(params[:email])
    session[:user_id] = @user.id  #creates session
  end
  redirect '/'
end

delete '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/signup' do
  erb :"/users/new"
end

post '/users/new' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/user/profile"
  end
end

get '/survey/:id' do
  @survey = Survey.find(params[:id])
  @questions = @survey.questions

  erb :survey
end

post '/survey/:id/vote' do
  participation = Participation.create({taker_id: current_user.id, survey_id: params[:id]})
  params[:response].each do |index, choice_id|
    Response.create({choice_id: choice_id, participation_id: participation.id})
  end

  redirect '/user/profile'
end
