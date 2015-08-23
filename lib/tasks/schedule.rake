namespace :scheduler do
  desc 'Send Regulatory Report'
  task :regulatory_report => :environment do
    if UserMailer.set_recipients_regulatory
      Story.not_sent.each { |story| story.update_attribute(:sent, true) }
    end
  end
end
