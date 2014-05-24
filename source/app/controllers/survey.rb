get '/surveys/new' do

    erb :'surveys/new'
end

post '/surveys/new' do
  @survey = Survey.create(
    name: params[:survey_name],
    creator_id: current_user.id)

    erb :'questions/new'
end

get '/survey/:id' do
  @survey = Survey.find(params[:id])
  @questions = @survey.questions

  erb :survey
end

post '/surveys/:id/vote' do
  participation = Participation.create({taker_id: current_user.id, survey_id: params[:id]})
  params[:response].each do |index, choice_id|
    Response.create({choice_id: choice_id, participation_id: participation.id})
  end

  redirect '/user/profile'
end

#================= Results page
get '/surveys/:id/result' do
  @survey = Survey.find_by_id(params[:id])
  @questions = @survey.questions
  erb :"surveys/result"
end
