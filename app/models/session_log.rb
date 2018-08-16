class SessionLog < ActiveRecord::Base
  default_scope { order(:created_at, :email) }
end
