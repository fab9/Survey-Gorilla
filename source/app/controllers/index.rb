get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/sessions/new' do
  if User.authenticate(params[:email], params[:password])
    user = User.find_by_email(params[:email])
    session[:user_id] = user.id  #creates session
    redirect ('/')
  else
    redirect ('/')
  end
end

get '/user/profile' do
    @surveys_created = current_user.created_surveys
    @surveys_taken = current_user.taken_surveys
    erb :'users/profile'
end

#================= Show survey
get '/surveys/new' do

    erb :'surveys/new'
end

post '/surveys/new' do
  @survey = Survey.create(
    name: params[:survey_name],
    creator_id: current_user.id)

    redirect :'users/profile'
end
