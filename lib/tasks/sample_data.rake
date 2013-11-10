namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_listings
    make_relationships

  end
end


def make_users
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

def make_listings
  users = User.all(limit: 20)
  35.times do
    title = Faker::Lorem.sentence(2)
    country = "France"
    city = "Cannes"
    region = "Provence"
    description = Faker::Lorem.sentence(2) 
    background = Faker::Lorem.sentence(2)
    imageurl = "https://si0.twimg.com/profile_images/2730930329/fa574a41aa80b8c5333e21086a1d5f4b.jpeg" 

    users.each { |user| 
      user.listings.create!(title: title, country: country, city: city, region: region,description: description, background: background, imageurl: imageurl) 
      }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end