namespace :db do
  desc "Erase and fill database"

  task :posts => :environment do
    require 'faker'

    #Rake::Task['db:reset'].invoke

    user_ids = User.all.ids

    # Create 15 posts
    15.times do
      Post.create do |post|
        post.title = Faker::Lorem.sentence
        post.body = Faker::Lorem.paragraph
        post.published_at = Faker::Time.between(DateTime.now - 31, DateTime.now)
        post.user_id = user_ids[rand(user_ids.length)]
      end
    end
  end
end