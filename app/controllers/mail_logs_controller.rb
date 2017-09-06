class MailLogsController < InheritedResources::Base

  private

    def mail_log_params
      params.require(:mail_log).permit(:email, :subject, :options)
    end
end

