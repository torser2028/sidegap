class UserMailer < ApplicationMailer
  default from: 'SIDEGAP <sidegap@valure.com.co>'

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Sidegap!')
  end

  def self.set_recipients_new_rule(rule)
    mutex = Mutex.new
    Thread.new do
      # send in backgound trhead
      mutex.synchronize do
        institution = rule.institution.name
        recipients = []
        recipients = UserNotification.includes(:user, :institution).where(institutions: { name: institution }).map(&:user).to_a
        recipients.each do |recipient|
          new_rule(recipient, institution, rule).deliver_now
        end
      end
      ActiveRecord::Base.connection.close
    end
  end

  def new_rule(recipient, institution, rule)
    @rule = rule
    @institution = institution
    @name = recipient[:name]
    to = recipient[:email]

    company = Company.find(recipient.company_id)
    @bcc = send_mail_user_company(to, company)

    if mail(to: to, subject: 'Nueva norma en proceso de consulta', bcc: @bcc)
      mail_log = MailLog.new(email: recipient.email, subject: 'Nueva norma en proceso de consulta', options: {institution: @institution, rule: @rule.title, name: @name, company_emails: @bcc})
      mail_log.save!
    else
      mail_log = MailLog.new(email: recipient.email, subject: "Ha ocurrido un error enviando los correos de 'Nueva norma en proceso de consulta'", options: {institution: @institution, rule: @rule.title, name: @name, company_emails: @bcc})
      mail_log.save!
    end
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
    to = recipient.email

    company = Company.find(recipient.company_id)
    @bcc = send_mail_user_company(to, company)

    mail_log = MailLog.new(email: recipient.email, subject: 'Cambios en mis proyectos favoritos', options: {project: @project.title, change_type: @change_type, name: @name, company_emails: @bcc})
    mail_log.save!

    mail(to: to, subject: 'Cambios en mis proyectos favoritos', bcc: @bcc)
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
    to = recipient.email
    company = Company.find(recipient.company_id)
    @bcc = send_mail_user_company(to, company)

    @authors = []
    @chamber_speakers = []
    @senate_speakers = []
    authors.each { |author| @authors << Stakeholder.find(author) }
    chamber_speakers.each { |chamber_speaker| @chamber_speakers << Stakeholder.find(chamber_speaker) }
    senate_speakers.each { |senate_speaker| @senate_speakers << Stakeholder.find(senate_speaker) }

    mail_log = MailLog.new(email: recipient.email, subject: 'Cambios en mis proyectos favoritos', options: {project: @project.title, name: @name, company_emails: @bcc})
    mail_log.save!

    mail(to: to, subject: 'Cambios en mis proyectos favoritos', bcc: @bcc)
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
    to = recipient.email

    company = Company.find(recipient.company_id)
    @bcc = send_mail_user_company(to, company)

    mail_log = MailLog.new(email: recipient.email, subject: 'Alerta regulatoria', options: {alert: @alert.title, name: @name, company_emails: @bcc})
    mail_log.save!

    mail(to: to, subject: 'Alerta regulatoria', bcc: @bcc)
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
    to = recipient.email

    mail_log = MailLog.new(email: recipient.email, subject: 'Actualidad Regulatoria', options: {
      legislatives: (@legislatives_stories.present? ? @legislatives_stories.map(&:project_rule) : ''),
      councils: (@councils_stories.present? ? @councils_stories.map(&:project_rule) : ''),
      rules: (@rules_stories.present? ? @rules_stories.map(&:project_rule) : '')
    })
    mail_log.save!

    mail(to: to, subject: 'Actualidad Regulatoria')
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

  # def self.set_recipients_weekly_test
  #   User.all.each do |recipient|
  #     if recipient.email == "camiloquimbayo@gmx.com" || recipient.email == "juanacifuentes08@hotmail.com"
  #       weekly_report(recipient).deliver_now
  #     end
  #   end
  # end

  def weekly_report(recipient)
    @name = recipient.name

    # User following
    following_legislatives = recipient.following_legislatives
    user_following = following_legislatives.to_a
    # following_councils = recipient.following_councils

    changed = []
    user_following.each do |legislative|
      last_monday = (Date.today - 7.days).beginning_of_week.beginning_of_day
      changed << legislative if legislative.status_updated_at.present? && legislative.status_updated_at > last_monday
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

    to = recipient.email
    company = Company.find(recipient.company_id)
    @bcc = send_mail_user_company(to, company)

    mail_log = MailLog.new(email: recipient.email, subject: 'Estado semanal de su cuenta', options: {company_emails: @bcc})
    mail_log.save!

    mail(to: to, subject: 'Estado semanal de su cuenta', bcc: @bcc)
  end

  def send_mail_user_company(to, company)
    if company.main_email == to
      bcc = company.extra_emails if company.extra_emails.present?
    end
    bcc
  end
end
