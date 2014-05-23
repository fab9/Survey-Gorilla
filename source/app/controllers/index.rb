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
