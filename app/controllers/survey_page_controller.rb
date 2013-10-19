get '/survey_page' do
  @survey = Survey.find(1)
  @questions = @survey.questions
  erb :survey_page
end


post '/survey_page' do
  @user = User.find(1)
  @survey = Survey.find(1)
  @questions = @survey.questions
  @submission = Submission.create

  @questions.each do |question|
    question.choices.each do |choice|
      p choice.responses << Response.create(submission_id: @submission.id, choice_id: choice.id)
    end
  end



  # @choices = @questions.choices
  @user.taken_surveys << @survey

  
  p params

  # @user.submissions.find(1).responses << Response.create(submission_id: submission, choice_id: )
  
  redirect '/'
end