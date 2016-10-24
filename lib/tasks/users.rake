namespace :db do
  desc "Erase and fill database"

  task :users => :environment do
    require 'faker'

    5.times do
      User.create do |user|
        pass = Faker::Internet.password
        user.nickname = Faker::Internet.user_name
        user.email = Faker::Internet.email
        user.password = pass
        puts "nick: #{user.nickname} | email: #{user.email} | pass: #{pass}"
      end
    end
  end
end