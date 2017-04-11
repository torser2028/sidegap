namespace :scheduler do
  desc 'Send Regulatory Report'
  task :regulatory_report => :environment do
    time = Time.now
    if time.monday? || time.wednesday? || time.friday?
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
    if time.monday?
      if UserMailer.set_recipients_weekly
        puts 'Weekly report sent.'
      else
        puts 'Weekly report not sent.'
      end
    end
  end

  desc 'Test Regulatory Report'
  task :test_regulatory => :environment do
    if UserMailer.set_recipients_regulatory
      Story.not_sent.each { |story| story.update_attribute(:sent, true) }
      puts 'Regulatory report sent.'
    else
      puts 'There is no stories available.'
    end
  end

  desc 'Test Weekly Report'
  task :test_week => :environment do
    if UserMailer.set_recipients_weekly
      puts 'Weekly report sent.'
    else
      puts 'Weekly report not sent.'
    end
  end
end
