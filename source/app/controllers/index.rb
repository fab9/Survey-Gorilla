get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/' do
  if User.authenticate(params[:username], params[:password])
   @user = User.find_by_username(params[:username])
    session[:user_id] = @user.id  #creates session
    redirect "/user/#{current_user.id}"
  else
    redirect '/'
  end
end
