class StakeholdersPeriod < ActiveRecord::Base
  belongs_to :period
  belongs_to :stakeholder
end
