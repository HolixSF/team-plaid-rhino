require 'faker'

4.times do
  user = User.new(
    username: Faker::App.name,
    )
  user.password = "1234"
  user.save
end

15.times do
  question= Question.create(
  user_id: rand(1..4),
  title: Faker::Company.catch_phrase,
  text: Faker::Company.bs
  )
  question.save
end

40.times do
  answer = Answer.create(
  user_id: rand(1..4),
  question_id: rand(1..15),
  text: Faker::Hacker.say_something_smart
  )
  answer.save
end

# Response.create

# Vote.create

