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

  desc 'Send Weekly Report'
  task :weekly_report => :environment do
    time = Time.now
    if time.monday? && time.hour == 7
      if UserMailer.set_recipients_weekly
        Legislative.new_projects.each { |legislative| legislative.update_attribute(:new_project, false) }
        puts 'Weekly report sent.'
      else
        puts 'Weekly report not sent.'
      end
    end
  end
end