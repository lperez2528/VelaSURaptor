require 'faker'
10.times do
  User.create(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.email,
              password: "123456 ",
              birthdate: Date.today - rand(15..40)*365,
              home_city: Faker::Address.city,)
end

20.times do
  User.all.sample.created_surveys << Survey.create(title: Faker::Company.bs,
                                                   description: Faker::Company.catch_phrase
                                                    )
end

200.times do 
  question = Question.create(description: "How to #{Faker::Company.bs}")
  Survey.all.sample.questions << question
  rand(2..4).times do 
    question.choices << Choice.create(text: "We should #{Faker::Company.bs}")
  end
end


60.times do 
  User.all.sample.taken_surveys << Survey.all.sample
end

User.all.each do |user|
  user.submissions.each do |submission|
    submission.survey.questions.each do |question|
        submission.responses << Response.create(choice_id: question.choices.sample.id)
    end
  end
end


