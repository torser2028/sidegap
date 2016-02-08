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
    mail(to: recipient.email, subject: "Alerta regulatoria")
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

  def self.set_recipients_weekly
    User.all.each do |recipient|
      weekly_report(recipient).deliver_now
    end
  end

  def weekly_report(recipient)
    following_legislatives = recipient.following_legislatives

    changed = []
    following_legislatives.each do |legislative|
      changed << legislative if legislative.last_status != legislative.status
    end
    @user_following = following_legislatives.count
    @user_approved = following_legislatives.law.count
    @user_changed_status = changed.count
    @user_with_agenda = following_legislatives.with_agenda.count
    @user_topics = following_legislatives.group(:topic).count

    @new_projects = Legislative.new_projects.count
    @law = Legislative.law.count
    @archived = Legislative.archived.count
    @retired = Legislative.retired.count
    @with_agenda = Legislative.with_agenda.count
    @topics = Legislative.new_projects.group(:topic).count
    @name = recipient.name

    mail(to: recipient.email, subject: "Estado semanal de su cuenta")
  end
end
