class RegulatoryAlert < ActiveRecord::Base
  after_create :send_alert

  private
    def send_alert
      # UserMailer.set_recipients_alert(self)
      User.all.each do |recipient|
        UserMailer.regulatory_alert(recipient, self).deliver_now
      end
    end
end
