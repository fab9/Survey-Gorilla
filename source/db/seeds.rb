require 'faker'

Survey.destroy_all
User.destroy_all
Question.destroy_all
Participation.destroy_all
Choice.destroy_all
Response.destroy_all

20.times do
  User.create({name: Faker::Name.name, email: Faker::Internet.email, password: "password"})
end

User.all.each do |user|
  3.times do
    user.created_surveys << Survey.create({name: Faker::Address.country})
  end
end

Survey.all.each do |survey|
  5.times do
    survey.questions << Question.create({text: Faker::Lorem.sentence + "?"})
  end
end

Question.all.each do |question|
  4.times do
    question.choices << Choice.create({text: Faker::Lorem.sentence})
  end
end

User.all.each do |user|
  survey = Survey.all.sample
  participation = Participation.create!({taker_id: user.id, survey_id: survey.id})
  survey.questions.each do |question|
    choice = question.choices.sample
    Response.create!({participation_id: participation.id, choice_id: choice.id})
  end
end
