class LegislativeStakeholder < ActiveRecord::Base
  belongs_to :legislative
  belongs_to :stakeholder
end
