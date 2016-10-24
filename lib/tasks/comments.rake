namespace :db do
  desc "Erase and fill database"

  task :comments => :environment do
    require 'faker'

    #Rake::Task['db:reset'].invoke

    user_ids = User.all.ids

    50.times do
      Comment.create do |comment|
        comment.body = Faker::Lorem.paragraph
        comment.published_at = Faker::Time.between(DateTime.now - 31, DateTime.now)
        comment.user_id = user_ids[rand(user_ids.length)]
      end
    end
  end
end