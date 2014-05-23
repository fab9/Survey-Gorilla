require 'faker'

20.times {
  User.create({name: Faker::Name.name, email: Faker::Internet.email, password: "password"})
}

