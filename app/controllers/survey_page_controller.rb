get '/survey_page/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  @questions = @survey.questions
  erb :survey_page
end


post '/survey_page/:survey_id' do
  @current_user = User.find(session[:user_id])

  @survey = Survey.find(params[:survey_id])
  @questions = @survey.questions
  @submission = Submission.create(taker_id: @current_user.id, survey_id: @survey.id)
  choice_hash = params[:current_choices]  

  choice_hash.each do |question, choice|
    Response.create(submission_id: @submission.id, choice_id: choice)
  end

  @current_user.taken_surveys << @survey
  redirect "/congrats"
end
