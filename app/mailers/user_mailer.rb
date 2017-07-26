class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Sidegap!')
  end

  def self.set_recipients_new_rule(rule)
    Thread.new do
      # send in backgound thead
      institution = rule.institution.name
      recipients = UserNotification.includes(:user, :institution).where(institutions: { name: institution }).map(&:user).to_a
      recipients.each do |recipient|
        new_rule(recipient, institution, rule).deliver_now
      end
      ActiveRecord::Base.connection.close
    end
  end

  def new_rule(recipient, institution, rule)
    @rule = rule
    @institution = institution
    @name = recipient.name
    mail(to: recipient.email, subject: "Nueva norma en proceso de consulta")
    #en este espacio validar correos de la empresa
    puts "julian"
    puts Company.all
  end

  def self.set_recipients_project_notification(project, change_type)
    Thread.new do
      # send in backgound thead
      project.followers.each do |recipient|
        project_notification(recipient, project, change_type).deliver_now
      end
      ActiveRecord::Base.connection.close
    end
  end

  def project_notification(recipient, project, change_type)
    @project = project
    @change_type = change_type
    @name = recipient.name
    mail(to: recipient.email, subject: "Cambios en mis proyectos favoritos")
  end

  def self.set_recipients_stakeholder_notification(project, authors, chamber_speakers, senate_speakers)
    Thread.new do
      # send in backgound thead
      project.followers.each do |recipient|
        stakeholder_notification(recipient, project, authors, chamber_speakers, senate_speakers).deliver_now
      end
      ActiveRecord::Base.connection.close
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
    Thread.new do
      # send in backgound thead
      User.all.each do |recipient|
        regulatory_alert(recipient, alert).deliver_now
      end
      ActiveRecord::Base.connection.close
    end
  end

  def regulatory_alert(recipient, alert)
    @alert = alert
    @name = recipient.name
    mail(to: recipient.email, subject: "Alerta regulatoria")
  end

  def self.set_recipients_regulatory
    Thread.new do
      # send in backgound thead
      self.set_recipients_regulatory_fg()
      ActiveRecord::Base.connection.close
    end
  end

  def self.set_recipients_regulatory_fg
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
    Thread.new do
      # send in backgound thead
      self.set_recipients_weekly_fg()
      ActiveRecord::Base.connection.close
    end
  end

  def self.set_recipients_weekly_fg
    User.all.each do |recipient|
      weekly_report(recipient).deliver_now
    end
  end

  def self.set_recipients_weekly_test
    User.all.each do |recipient|
      if recipient.email == "camiloquimbayo@gmx.com" || recipient.email == "juanacifuentes08@hotmail.com"
        weekly_report(recipient).deliver_now
      end
    end
  end

  def weekly_report(recipient)
    @name = recipient.name

    # User following
    following_legislatives = recipient.following_legislatives
    user_following = following_legislatives.to_a
    # following_councils = recipient.following_councils

    changed = []
    user_following.each do |legislative|
      changed << legislative if legislative.last_status != legislative.status
    end
    @user_following = user_following.count
    @user_topics = user_following.group_by(&:topic)
    @user_changed_status = changed.count
    @user_approved = following_legislatives.law.count
    @user_with_agenda = following_legislatives.with_agenda.count

    # General chnages
    @actual_projects = Legislative.actual.to_a
    @status_changed_projects = Legislative.actual_status_changed.to_a
    @archived_projects = Legislative.actual_archived.to_a
    @retired_projects = Legislative.actual_retired.to_a
    
    @actual = @actual_projects.count
    @topics = @actual_projects.group_by(&:topic)
    @status_changed = @status_changed_projects.count
    @archived = @archived_projects.count
    @retired = @retired_projects.count
    @with_agenda = Legislative.with_agenda.count

    mail(to: recipient.email, subject: "Estado semanal de su cuenta")
  end
end
