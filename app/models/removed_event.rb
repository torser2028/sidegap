class RemovedEvent < ActiveRecord::Base
  serialize :events_ids, JSON
end