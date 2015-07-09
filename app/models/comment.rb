class Comment < ActiveRecord::Base
  belongs_to :legislative
  belongs_to :rule
  belongs_to :user
  belongs_to :council

  IMPACT = %w(1 2 3 4 5 6)
end
