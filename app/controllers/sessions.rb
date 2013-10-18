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
    redirect '/logged_homepage'
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


get '/edit_profile' do
  @user = current_user
  erb :edit_profile
end

post '/edit_profile' do
  @user = current_user
  @user.update_attributes(first_name: params[:first_name],
                          last_name: params[:last_name],
                          email: params[:email],
                          birthdate: params[:birthdate],
                          home_city: params[:home_city],
                          zipcode: params[:zipcode],
                          gravatar: params[:gravatar])
  redirect to('/logged_homepage')
end

get '/logged_homepage' do
  @user = current_user
  @surveys = Survey.all
  erb :logged_homepage
end
