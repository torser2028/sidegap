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
    validate_day = ARGV[1] || true
    puts "validate day? #{validate_day}"
    time = Time.now
    monday = time.beginning_of_week
    puts "Monday: #{monday}"
    last_saturday = (time - 7.days).end_of_week - 1.day
    puts "last_saturday: #{last_saturday}"
    holiday = Holidays.on(monday, :co)
    puts "holiday: #{holiday}"
    day_string = holiday.count.zero? ? 'Tuesday' : 'Wednesday'
    puts "Day: #{day_string}"
    agendas_ids = []
    events_ids = []
    if time.strftime('%A') == day_string || validate_day == 'false'
      puts "Is #{day_string}"
      Event.status_active.each do |event|
        puts "Event #{event.id} fecha #{event.event_at}"
        next unless event.event_at? && event.event_at < last_saturday
        puts "Changing status for event #{event.id}"
        event.status = false
        if event.save
          events_ids.push(event.id)
        else
          events_ids.push(event.errors.full_messages)
        end
      end
      Agenda.status_active.each do |agenda|
        puts "Agenda #{agenda.id} fecha #{agenda.event_at}"
        next unless agenda.event_at? && agenda.event_at < last_saturday
        puts "Changing status for agenda #{agenda.id}"
        agenda.status = false
        if agenda.save
          agendas_ids.push(agenda.id)
        else
          agendas_ids.push(agenda.errors.full_messages)
        end
      end
    end
    RemovedAgenda.create(agendas_ids: agendas_ids, day: day_string)
    RemovedEvent.create(events_ids: events_ids, day: day_string)
    exit
  end

  desc 'Disable rules after 15 days with not deadline comments date'
  task disable_rules: :environment do
    rules_without_deadline_date = Rule.where(deadline_comments: nil).all
    disabled_rules = []
    rules_without_deadline_date.each do |rule|
      time = Time.now
      rule_date = rule.created_at.to_date
      business_days = rule_date.business_dates_until(time).count
      holidays = Holidays.between(rule_date, time, :co).count
      total_business_days = business_days - holidays
      puts "Business days between #{rule_date} and #{time}: #{business_days}"
      puts "Holidays days between #{rule_date} and #{time}: #{holidays}"
      puts "Total business days: #{total_business_days}"
      next unless total_business_days > 15
      puts "the rule #{rule.id} is going to be disabled"
      disabled_rules.push(rule.id)
      rule.status = false
      rule.save!
    end
    UserMailer.disabling_rules(disabled_rules)
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
