get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/sessions/new' do
  if User.authenticate(params[:email], params[:password])
    @user = User.find_by_email(params[:email])
    session[:user_id] = @user.id  #creates session
  end
  redirect '/'
end
