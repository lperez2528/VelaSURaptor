get "/results/survey/:survey_id" do

@survey = Survey.find(params[:survey_id])
@user = User.find(session[:user_id])
@total_takers = @survey.takers.count



erb :results_page
end
