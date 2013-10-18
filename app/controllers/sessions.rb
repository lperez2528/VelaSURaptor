get '/login' do
  erb :login
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/login' do
  user = User.find_by_email(params[:email])
  auth_user = user.authenticate(params[:password])

  if auth_user
    session[:user_id] = auth_user.id
    redirect '/'
  elsif user
    @error = "Wrong password"
  else
    @error = "User #{params[:email]} was not found"
  end

end

post '/signup' do
  user = User.create(params[:user])
  session[:user_id] = user.id
  redirect '/'
end
