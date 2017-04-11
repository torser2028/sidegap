namespace :scheduler do
  desc 'Send Regulatory Report'
  task :regulatory_report => :environment do
    time = Time.now
    if time.monday? || time.wednesday? || time.friday?
      Thread.new do
        if UserMailer.set_recipients_regulatory_fg
          Story.not_sent.each { |story| story.update_attribute(:sent, true) }
          puts 'Regulatory report sent.'
        else
          puts 'There is no stories available.'
        end
      end.join
    end
  end

  desc 'Send Weekly Report'
  task :weekly_report => :environment do
    time = Time.now
    if time.monday?
      Thread.new do
        if UserMailer.set_recipients_weekly_fg
          puts 'Weekly report sent.'
        else
          puts 'Weekly report not sent.'
        end
      end.join
    end
  end

  desc 'Test Regulatory Report'
  task :test_regulatory => :environment do
    Thread.new do
      if UserMailer.set_recipients_regulatory_fg
        Story.not_sent.each { |story| story.update_attribute(:sent, true) }
        puts 'Regulatory report sent.'
      else
        puts 'There is no stories available.'
      end
    end.join
  end

  desc 'Test Weekly Report'
  task :test_week => :environment do
    Thread.new do
      if UserMailer.set_recipients_weekly_fg
        puts 'Weekly report sent.'
      else
        puts 'Weekly report not sent.'
      end
    end.join
  end
end
