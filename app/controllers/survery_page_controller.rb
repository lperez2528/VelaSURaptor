get '/survey_page' do
  @survey = Survey.find(1)
  @questions = @survey.questions
  erb :survey_page
end


post '/survey_page' do
  @survey = Survey.find(1)
  @questions = @survey.questions
  @choices = @questions.choices
  

  redirect '/'
end