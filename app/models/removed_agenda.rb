class RemovedAgenda < ActiveRecord::Base
  serialize :agendas_ids, JSON
end
