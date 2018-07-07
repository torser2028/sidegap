class StakeholdersPeriod < ActiveRecord::Base
  belongs_to :period
  belongs_to :stakeholder

  def self.active_period(stakeholder_id, period_id)
    period_id = Period.active.id if period_id.nil?
    StakeholdersPeriod.where(period_id: period_id, stakeholder_id: stakeholder_id).last
  end
end
