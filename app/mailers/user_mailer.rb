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

  def self.set_recipients_alert(alert)
    User.all.each do |recipient|
      regulatory_alert(recipient, alert).deliver_now
    end
  end

  def regulatory_alert(recipient, alert)
    @alert = alert
    @name = recipient.name
    mail(to: recipient.email, subject: "Nueva alerta regulatoria")
  end

  def self.set_recipients_regulatory
    legislatives_stories = Story.not_sent.legislatives
    councils_stories = Story.not_sent.councils
    rules_stories = Story.not_sent.rules

    if legislatives_stories.present? || councils_stories.present? || rules_stories.present?
      User.all.each do |recipient|
        regulatory_report(recipient, legislatives_stories, councils_stories, rules_stories).deliver_now
      end
    end
  end

  def regulatory_report(recipient, legislatives_stories, councils_stories, rules_stories)
    @legislatives_stories = legislatives_stories
    @councils_stories = councils_stories
    @rules_stories = rules_stories
    @name = recipient.name
    
    mail(to: recipient.email, subject: "Actualidad Regulatoria")
  end
end
