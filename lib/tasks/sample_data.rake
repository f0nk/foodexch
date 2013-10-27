namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    admin = User.create!(name: "Admin",
                             email: "admin@food.com",
                             password: "password",
                             password_confirmation: "password")
        admin.toggle!(:admin)
    User.create!(name: "Example User",
                 email: "example@foodexchange.com",
                 password: "password",
                 password_confirmation: "password")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@foodexchange.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end