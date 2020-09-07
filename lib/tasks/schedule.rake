namespace :scheduler do
  desc 'Send Regulatory Report'
  task regulatory_report: :environment do
    time = Time.now
    if time.monday? || time.wednesday? || time.friday?
      puts 'is monday, wednesday or friday'
      Thread.new do
        puts 'starts the thread'
        if UserMailer.set_recipients_regulatory_fg
          puts 'in the if'
          Story.not_sent.each { |story| story.update_attributes(sent: true, sent_at: Time.now) }
          ActiveRecord::Base.connection.close
          puts 'Regulatory report sent.'
        else
          ActiveRecord::Base.connection.close
          puts 'There is no stories available.'
        end
      end.join
    end
  end

  desc 'Send Weekly Report'
  task weekly_report: :environment do
    time = Time.now
    if time.monday?
      Thread.new do
        if UserMailer.set_recipients_weekly_fg
          ActiveRecord::Base.connection.close
          puts 'Weekly report sent.'
        else
          puts 'Weekly report not sent.'
          ActiveRecord::Base.connection.close
        end
      end.join
    end
  end

  desc 'Disable past events and agends'
  task disable_events_agends: :environment do
    time = Time.now
    if time.tuesday?
      puts 'Is Tuesday'
      Event.status_active.each do |event|
        next unless event.event_at < time
        puts "Changing status for event #{event.id}"
        event.status = false
        event.save!
      end
      Agenda.status_active.each do |agenda|
        next unless agenda.event_at < time
        puts "Changing status for agenda #{agenda.id}"
        agenda.status = false
        agenda.save!
      end
    end
  end

  # desc 'Test Regulatory Report'
  # task :test_regulatory => :environment do
  #   Thread.new do
  #     if UserMailer.set_recipients_regulatory_fg
  #       Story.not_sent.each { |story| story.update_attribute(:sent, true) }
  #       ActiveRecord::Base.connection.close
  #       puts 'Regulatory report sent.'
  #     else
  #       puts 'There is no stories available.'
  #       ActiveRecord::Base.connection.close
  #     end
  #   end.join
  # end

  # desc 'Test Weekly Report'
  # task :test_week => :environment do
  #   Thread.new do
  #     if UserMailer.set_recipients_weekly_fg
  #       ActiveRecord::Base.connection.close
  #       puts 'Weekly report sent.'
  #     else
  #       puts 'Weekly report not sent.'
  #       ActiveRecord::Base.connection.close
  #     end
  #   end.join
  # end
end
