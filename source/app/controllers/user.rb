post '/sessions/new' do
  if User.authenticate(params[:email], params[:password])
    user = User.find_by_email(params[:email])
    session[:user_id] = user.id  #creates session
    redirect ('/user/profile')
  else
    redirect ('/')
  end
end

get '/user/profile' do
  if !current_user.nil? #&& !current_user.created_surveys.nil? && !current_user.taken_surveys.nil?
    @surveys_created = current_user.created_surveys
    @surveys_taken = current_user.taken_surveys
    erb :'users/profile'
  end
end

delete '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/signup' do
  @hide_login_form = true
  erb :"/users/new"
end

post '/users/new' do
  user = User.create(params[:user])
  session[:user_id] = user.id
  redirect "/"
end

