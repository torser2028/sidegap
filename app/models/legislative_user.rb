class LegislativeUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :legislative

  IMPACT = %w(1 2 3 4 5 6)
end
