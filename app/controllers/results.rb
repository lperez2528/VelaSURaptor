get "/results/survey_page/:survey_id" do

  @survey = Survey.find(params[:survey_id])
  @total_takers = @survey.takers.count

  if request.xhr?
    content_type :json
    
    return @survey.stats.to_json
  else
    erb :results_page
  end

end
