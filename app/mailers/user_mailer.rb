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
    mail(to: recipient.email, subject: "Cambios en mis proyectos favoritos")
  end

  def self.set_recipients_stakeholder_notification(project, authors, chamber_speakers, senate_speakers)
    project.followers.each do |recipient|
      stakeholder_notification(recipient, project, authors, chamber_speakers, senate_speakers).deliver_now
    end
  end

  def stakeholder_notification(recipient, project, authors, chamber_speakers, senate_speakers)
    @project = project
    @name = recipient.name
    
    @authors = []
    @chamber_speakers = []
    @senate_speakers = []
    authors.each { |author| @authors << Stakeholder.find(author) }
    chamber_speakers.each { |chamber_speaker| @chamber_speakers << Stakeholder.find(chamber_speaker) }
    senate_speakers.each { |senate_speaker| @senate_speakers << Stakeholder.find(senate_speaker) }
    
    mail(to: recipient.email, subject: "Cambios en mis proyectos favoritos")
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
    @name = recipient.name
    
    following_legislatives = recipient.following_legislatives
    following_councils = recipient.following_councils

    changed = []
    following_legislatives.each do |legislative|
      changed << legislative if legislative.last_status != legislative.status
    end
    @user_following = following_legislatives.count
    @user_approved = following_legislatives.law.count
    @user_changed_status = changed.count
    @user_with_agenda = following_legislatives.with_agenda.count
    @user_topics = following_legislatives.group(:topic).count

    actual_approved = []
    Legislative.actual_approved.each do |legislative|
      actual_approved << legislative if legislative.status != legislative.last_status
    end

    @actual = Legislative.actual.count
    @approved = actual_approved.count
    @archived = Legislative.actual_archived.count
    @retired = Legislative.actual_retired.count
    @with_agenda = Legislative.with_agenda.count
    @topics = Legislative.actual.group(:topic).count

    @actual_projects = Legislative.actual
    @approved_projects = actual_approved
    @archived_projects = Legislative.actual_archived
    @retired_projects = Legislative.actual_retired

    mail(to: recipient.email, subject: "Estado semanal de su cuenta")
  end
end
