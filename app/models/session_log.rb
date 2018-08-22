class SessionLog < ActiveRecord::Base
  default_scope { order(:email, :created_at) }
end
