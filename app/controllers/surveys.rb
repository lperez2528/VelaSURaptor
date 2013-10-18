get '/' do
  @surveys = Survey.all
  erb :index
end
