namespace :scheduler do
  desc 'Send Regulatory Report'
  task :regulatory_report => :environment do
    time = Time.now
    if (time.monday? && time.hour == 12) || (time.wednesday? && time.hour == 7) || (time.friday? && time.hour == 7)
      if UserMailer.set_recipients_regulatory
        Story.not_sent.each { |story| story.update_attribute(:sent, true) }
        puts 'Regulatory report sent.'
      else
        puts 'There is no stories available.'
      end
    end
  end
end
