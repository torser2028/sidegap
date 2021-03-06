# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

every :monday, at: '12pm' do
# every 5.minutes do
  rake "scheduler:weekly_report"
end

every :monday, at: '5pm' do
  rake "scheduler:regulatory_report"
end
every :wednesday, at: '5pm' do
  rake "scheduler:regulatory_report"
end
every :friday, at: '5pm' do
  rake "scheduler:regulatory_report"
end
every :tuesday, at: '5am' do
  rake "scheduler:disable_events_agends"
end
every :wednesday, at: '5am' do
  rake "scheduler:disable_events_agends"
end
every :day, at: '5am' do
  rake "scheduler:disable_rules"
end
