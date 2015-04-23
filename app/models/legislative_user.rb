class LegislativeUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :legislative
end
