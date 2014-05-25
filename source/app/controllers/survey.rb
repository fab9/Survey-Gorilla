get '/surveys/new' do
  erb :'surveys/new'
end

post '/survey/new' do
  params.inspect
  survey = Survey.create({name: params[:survey_name], image_url: params[:image]})
  current_user.created_surveys << survey
  params[:question].each do |index, question_text|
    survey.questions << Question.create({text: question_text})
    question = survey.questions.last
    params[:choice][index].each do |index, choice_text|
      question.choices << Choice.create({text: choice_text})
    end
  end
  redirect "/user/profile"
end

get '/survey/:id' do
  @survey = Survey.find(params[:id])
  @questions = @survey.questions
  if current_user.taken_surveys.include?(@survey)
    redirect 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'
  else
    erb :survey
  end
end

post '/survey/:id/vote' do
  participation = Participation.create({taker_id: current_user.id, survey_id: params[:id]})
  params[:response].each do |index, choice_id|
    Response.create({choice_id: choice_id, participation_id: participation.id})
  end
  redirect '/user/profile'
end

#================= Results page
get '/survey/:id/result' do
  @survey = Survey.find_by_id(params[:id])
  @questions = @survey.questions
  erb :"surveys/result"
end
