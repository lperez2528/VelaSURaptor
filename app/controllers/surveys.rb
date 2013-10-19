get '/' do
  @surveys = Survey.all
  erb :index
end

get '/create_survey' do 
  erb :create_survey
end
 
 
post '/create_survey' do
  survey = Survey.create(title: params[:create_title])
  questions = Hash[*params[:question].flatten]
  current_user.created_surveys << survey
 
  questions.each do |k,v|
    choice_array = v['choice']
 
    question = Question.create(description: k)
    survey.questions << question
 
    choice_array.each do |choice| 
      question.choices << Choice.create(text: choice) 
    end
  end
 
  redirect('/')
 
end
