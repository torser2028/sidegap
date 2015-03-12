namespace :db do
  desc 'Erase and fill database'
  task :populate_stories => :environment do
    Story.delete_all
    100.times do
      Story.create!(title: Faker::Name.title, body: Faker::Lorem.paragraph, source: Faker::Name::title)
    end
  end
end
