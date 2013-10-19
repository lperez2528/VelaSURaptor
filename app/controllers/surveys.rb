get '/' do
  @surveys = Survey.all
  erb :index
end

get '/create_survey' do 
  erb :create_survey
end
 
 
post '/create_survey' do
  survey = Survey.create(title: params[:create_title])
  questions = Hash[*params[:mc_question].flatten]
 
  questions.each do |k,v|
    choice_array = v['mc_answer']
 
    question = Question.create(description: k)
    survey.questions << question
 
    choice_array.each do |choice| 
      question.choices << Choice.create(text: choice) 
    end
  end
 
  redirect('/')
 
end
