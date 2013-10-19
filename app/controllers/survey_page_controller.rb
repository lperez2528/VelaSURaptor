get '/survey_page' do
  @survey = Survey.find(1)
  @questions = @survey.questions
  erb :survey_page
end


post '/survey_page' do
  @user = User.find(1)
  @survey = Survey.find(1)
  submissions = Submission.find(1)
  @questions = @survey.questions
  # @choices = @questions.choices
  @user.taken_surveys << @survey
  
  p params

  # @user.submissions.find(1).responses << Response.create(submission_id: submission, choice_id: )
  
  redirect '/'
end