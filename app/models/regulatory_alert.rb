class RegulatoryAlert < ActiveRecord::Base
  after_create :send_alert

  private
    def send_alert
      UserMailer.set_recipients_alert(self)
    end
end
