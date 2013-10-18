get '/' do
  erb :index
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