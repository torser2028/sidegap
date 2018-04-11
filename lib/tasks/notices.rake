namespace :notices do
  desc 'Query the notices without publish date and set it with the created at date'
  task set_publishe_date: :environment do
    Notice.where(publish_date: nil).all.each do |notice|
      notice.publish_date = notice.created_at
      notice.save!
    end
  end
end
