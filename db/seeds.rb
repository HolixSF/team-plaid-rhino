require 'faker'

4.times do
  user = User.new(
    username: Faker::App.name,
    )
  user.password = "1234"
  user.save
end

15.times do
  title = Faker::Company.catch_phrase
  question= Question.create(
  user_id: rand(1..4),
  title: title,
  text: Faker::Company.bs,
  slug: title.split(" ").join("_")
  )
  question.save
  Slug[question.slug] = question.id.to_s
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

