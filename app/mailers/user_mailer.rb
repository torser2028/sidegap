class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Sidegap!')
  end

  def self.set_recipients_new_rule(rule)
    institution = rule.institution.name
    recipients = UserNotification.includes(:user, :institution).where(institutions: { name: institution }).map(&:user)
    recipients.each do |recipient|
      new_rule(recipient, institution, rule).deliver_now
    end
  end

  def new_rule(recipient, institution, rule)
    @rule = rule
    @institution = institution
    @name = recipient.name
    mail(to: recipient.email, subject: "Nueva norma en proceso de consulta")
  end

  def self.set_recipients_project_notification(project, change_type)
    project.followers.each do |recipient|
      project_notification(recipient, project, change_type).deliver_now
    end
  end

  def project_notification(recipient, project, change_type)
    @project = project
    @change_type = change_type
    @name = recipient.name
    mail(to: recipient.email, subject: "Cambio en un proyecto de ley que es de su interés")
  end
end
