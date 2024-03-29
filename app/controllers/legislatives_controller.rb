# coding: utf-8
class LegislativesController < ApplicationController
  add_breadcrumb "Rama Legislativa", :legislatives_path

  before_action :get_institutions, only: [:period_stakeholders, :stakeholders]

  def index
    add_breadcrumb "Bandeja de Proyectos", :legislatives_path
    @q = Legislative.inbox.ransack(params[:q])
    @legislatives = []
    not_available_legislatives = current_user.find_disliked_items + current_user.following_legislatives
    @q.result.order(created_at: :desc).each do |item|
      @legislatives << item unless not_available_legislatives.include? item
    end
  end

  def projects_law
    add_breadcrumb "Proyectos - Ley", :projects_law_legislatives_path
    @q = Legislative.law.ransack params[:q]
    @legislatives = @q.result.order(created_at: :desc)
  end

  def projects_old
    add_breadcrumb "Proyectos - Archivado y Retirado", :projects_old_legislatives_path
    @q = Legislative.old.ransack params[:q]
    @legislatives = @q.result.order(created_at: :desc)
  end

  def favorites
    add_breadcrumb "Mis Favoritos", :favorites_legislatives_path
    @favorite = true
    @q = current_user.following_legislatives.includes(:legislative, :comments).ransack params[:q]
    @legislatives = @q.result.to_a - current_user.find_disliked_items
  end

  def current_week_favorites
    add_breadcrumb "Favoritos adicionados última semana", :favorites_legislatives_path
    @followed_legislatives = current_user.user_followed_legislatives.followed
  end

  def trash
    add_breadcrumb "Papelera", :trash_legislatives_path
    @legislatives = []
    @q = Legislative.ransack params[:q]
    @legislatives = current_user.get_down_voted(Legislative).to_a
  end

  def show_changes
    add_breadcrumb "Cambios en proyecto", :favorites_legislatives_path
    q = current_user.following_legislatives.includes(:legislative, :comments).ransack params[:q]
    legislatives_ids = (q.result.to_a - current_user.find_disliked_items).map(&:id)

    if Date.today.strftime('%a') == "Mon"
      start_date = (Time.now.in_time_zone('Bogota') - 1.day).beginning_of_week.beginning_of_day
      end_date = Time.now.in_time_zone('Bogota').beginning_of_week.beginning_of_day + 12.hours
    elsif Date.today.strftime('%a') == "Tue"
      start_date = (Time.now.in_time_zone('Bogota') - 2.days).beginning_of_week.beginning_of_day
      end_date = Time.now.in_time_zone('Bogota').beginning_of_week.beginning_of_day + 12.hours
    elsif Date.today.strftime('%a') == "Wed"
      start_date = (Time.now.in_time_zone('Bogota') - 3.days).beginning_of_week.beginning_of_day
      end_date = Time.now.in_time_zone('Bogota').beginning_of_week.beginning_of_day + 12.hours
    else
      start_date = Time.now.in_time_zone('Bogota').beginning_of_week.beginning_of_day
      end_date = Time.now.in_time_zone('Bogota').end_of_week.end_of_day + 12.hours
    end

    @change_by_status = LegislativeStatus.where(legislative_id: legislatives_ids, date: start_date..end_date)

    @change_by_attachments = LegislativeAttachmentChange.where(legislative_id: legislatives_ids, date: start_date..end_date)

    @change_by_stakeholders = LegislativeStakeholder.where(legislative_id: legislatives_ids, created_at: start_date..end_date)
  end

  def show
    add_breadcrumb "Proyecto", :legislative_path

    @legislative = get_legislative params[:id]
    @attachments = @legislative.attachments
    if @legislative.legislative
      @authors = @legislative.legislative.stakeholders.authors
      @senate_speakers = @legislative.legislative.stakeholders.senate_speakers
      @chamber_speakers = @legislative.legislative.stakeholders.chamber_speakers
      @attachments += @legislative.legislative.try(:attachments)
    else
      @authors = @legislative.stakeholders.authors
      @senate_speakers = @legislative.stakeholders.senate_speakers
      @chamber_speakers = @legislative.stakeholders.chamber_speakers
    end

    @comment = Comment.where(user: current_user, legislative: @legislative).first_or_initialize

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "detalle-de-proyecto"
      end
    end
  end

  def events
    add_breadcrumb "Eventos y Agenda", :events_legislatives_path
    if params[:q].present?
      @q = Agenda.includes(:legislative).ransack params[:q]
      @events = current_user.following_events.ransack(params[:q]).result.order(event_at: :desc)
    else
      @q = Agenda.includes(:legislative).ransack params[:q]
      @events = current_user.following_events.active.order(event_at: :desc)
    end
    @agendas = []
    @legislatives = current_user.following_legislatives.with_agenda.order(created_at: :desc)
    @q.result.each do |item|
      @legislatives.each do |legislative|
        @agendas << item if legislative.agendas.status_active.include? item
      end
    end

    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  def events_commission
    @q = Legislative.ransack params[:q]
    legislative = @q.result.order(created_at: :desc)
    @agendas = Agenda.includes(:legislative).where(legislative_id: legislative.map(&:id)).active.to_a

    @events = []
    events = current_user.following_events
    Event.active.order(event_at: :desc).each do |event|
      @events << event unless events.include? event
    end

    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  def follow
    @legislative = get_legislative params[:id]
    current_user.follow @legislative

    track_follow(current_user, @legislative)

    if @legislative.legislatives.present?
      @legislative.legislatives.each do |l|
        current_user.follow l
      end
    end
    redirect_to :back
  end

  def unfollow
    @legislative = get_legislative params[:id]
    current_user.stop_following @legislative

    track_unfollow(current_user, @legislative)

    if @legislative.legislatives.present?
      @legislative.legislatives.each do |l|
        current_user.stop_following l
      end
    end
    redirect_to :back
  end

  def dislike
    @legislative = get_legislative params[:id]
    current_user.dislikes @legislative
    if @legislative.legislatives.present?
      @legislative.legislatives.each do |l|
        current_user.dislikes l
      end
    end
    redirect_to :back
  end

  def like
    @legislative = get_legislative params[:id]
    current_user.likes @legislative
    if @legislative.legislatives.present?
      @legislative.legislatives.each do |l|
        current_user.likes l
      end
    end
    redirect_to :back
  end

  def period_stakeholders
    @period = Period.find(params[:id])
    add_breadcrumb 'Congresistas', :stakeholders_legislatives_path
    add_breadcrumb "Congresistas #{@period.name}"
    @q = @period.stakeholders.active.ransack params[:q]
    @stakeholders = @q.result
  end

  def stakeholders
    @period = Period.active
    add_breadcrumb 'Congresistas', :stakeholders_legislatives_path
    @q = Period.active.stakeholders.active.ransack params[:q]
    @stakeholders = @q.result
  end

  def stakeholder
    add_breadcrumb 'Perfil Congresista', :stakeholder_legislatives_path
    @stakeholder = Stakeholder.find params[:id]
    @period = if params[:period_id].present?
                Period.find(params[:period_id])
              else
                @stakeholder.periods.last
              end
    @legislatives_as_author = @stakeholder.legislatives.as_author
    @legislatives_as_speaker = @stakeholder.legislatives.as_speaker
    @stakeholder_period = StakeholdersPeriod.where(period_id: @period.id, stakeholder_id: @stakeholder.id).last
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "perfil #{@stakeholder.name}".parameterize
      end
    end
  end

  def risk_color risk
    return 'blue' if risk < 15
    return 'yellow' if risk < 25
    return 'orange' if risk < 31
    return 'red'
  end

  def get_risk_table
    risk_table = Hash.new
    # probability, impact
    risk_table[[ 1, 1 ]] = 1
    risk_table[[ 1, 2 ]] = 2
    risk_table[[ 2, 1 ]] = 3
    risk_table[[ 3, 1 ]] = 4
    risk_table[[ 4, 1 ]] = 5
    risk_table[[ 5, 1 ]] = 6
    risk_table[[ 6, 1 ]] = 7
    risk_table[[ 1, 3 ]] = 8
    risk_table[[ 2, 2 ]] = 9
    risk_table[[ 3, 2 ]] = 10
    risk_table[[ 4, 2 ]] = 11
    risk_table[[ 5, 2 ]] = 12
    risk_table[[ 6, 2 ]] = 13
    risk_table[[ 1, 4 ]] = 14
    risk_table[[ 2, 3 ]] = 15
    risk_table[[ 3, 3 ]] = 16
    risk_table[[ 1, 5 ]] = 17
    risk_table[[ 4, 3 ]] = 18
    risk_table[[ 5, 3 ]] = 19
    risk_table[[ 6, 3 ]] = 20
    risk_table[[ 1, 6 ]] = 21
    risk_table[[ 2, 4 ]] = 22
    risk_table[[ 3, 4 ]] = 23
    risk_table[[ 4, 4 ]] = 24
    risk_table[[ 5, 4 ]] = 25
    risk_table[[ 6, 4 ]] = 26
    risk_table[[ 2, 5 ]] = 27
    risk_table[[ 3, 5 ]] = 28
    risk_table[[ 4, 5 ]] = 29
    risk_table[[ 2, 6 ]] = 30
    risk_table[[ 5, 5 ]] = 31
    risk_table[[ 3, 6 ]] = 32
    risk_table[[ 6, 5 ]] = 33
    risk_table[[ 4, 6 ]] = 34
    risk_table[[ 5, 6 ]] = 35
    risk_table[[ 6, 6 ]] = 36

    return risk_table
  end

  def report
    user = current_user
    @report_date = Date.today.strftime('%d/%m/%Y')

    if params.has_key? 'user_id'
      user = User.find params[:user_id]
      @report_date = session[:report_date]
      @report_logo = session[:report_logo]
    else
      @report_logo = Company.find(user.company_id).avatar_url
    end

    risk_table = get_risk_table

    # Summary Week
    @summary_week = Notice.actual.where(user_id: user.id)

    # Events
    @today = Date.today
    @last_week = @today - 1.week
    @next_week = @today + 1.week
    day_name = Time.now.strftime("%A")
    holidays = Holidays.between(@last_week, @today, :co).count
    @last_week = (holidays > 0 && day_name === "Tuesday") ? (@last_week = @today - 1.week - 1.day) : @last_week

    last_agendas = []
    next_agendas = []

    legislatives = user.following_legislatives
    legislatives.all_with_agenda.order(created_at: :desc).each do |legislative|
      legislative.agendas.status_active.each do |agenda|
        if agenda.event_at > @last_week && agenda.event_at <= @today
          last_agendas << agenda
        elsif agenda.event_at > @today && agenda.event_at < @next_week
          next_agendas << agenda
        end
      end
    end

    @last_agendas = last_agendas.sort_by &:event_at
    @next_agendas = next_agendas.sort_by &:event_at

    @events = user.following_events.past_week.order(event_at: :desc)
    @events_next_week = user.following_events.next_week.order(event_at: :desc)

    # Risk and projects
    risk_list = []

    @legislatives = []
    legislatives.with_no_risk.each do |legislative|
      probability, impact = legislative.probability, legislative.comments.where(user: user).average(:impact).to_i
      risk = risk_table[[probability, impact]].to_i

      risk_list << risk

      @legislatives << {
        risk: risk,
        status: legislative.final_status != '' ? legislative.final_status : legislative.status,
        topic: legislative.topic,
        title: legislative.title
      }
    end

    @legislatives_by_risk = risk_list.sort.inject(Hash.new(0)) {|count, risk| count[risk] +=1; count}.to_a
    @legislatives_by_risk.each do |element|
      element << risk_color(element[0])
    end

    @legislatives_by_topic_with_risk = {}
    @legislatives.each do |legislative|
      topic = legislative[:topic]
      if !@legislatives_by_topic_with_risk.key?(topic) and legislative[:risk] >= 31
        @legislatives_by_topic_with_risk[topic] = 1
      elsif @legislatives_by_topic_with_risk.key?(topic) and legislative[:risk] >= 31
        @legislatives_by_topic_with_risk[topic] += 1
      end
    end
    @total_by_topic_with_risk = @legislatives_by_topic_with_risk.values.sum

    @legislatives_by_topic = legislatives.group(:topic).count
    @total_by_topic = @legislatives_by_topic.values.sum

    legislatives_by_final_status = legislatives.group(:final_status).count
    legislatives_by_final_status = legislatives_by_final_status.delete_if { |k, v| k == "" }

    @legislatives_by_status = legislatives.inbox.group(:status).count
    @legislatives_by_status = @legislatives_by_status.merge(legislatives_by_final_status)

    @total_by_status = @legislatives_by_status.values.sum + legislatives_by_final_status.values.sum

    @legislatives_by_source = legislatives.group(:source).count
    @total_by_source = @legislatives_by_source.values.sum

    # Authors and speakers

    @authors = {}
    legislatives.each do |legislative|
      legislative.stakeholders.authors.each do |author|
        probability, impact = legislative.probability, legislative.comments.where(user: user).average(:impact).to_i
        risk = impact ? risk_table[[probability, impact]].to_i : 0
        # if impact
        #   risk = risk_table[[probability, impact]].to_i
        # else
        #   risk = 0
        # end

        if @authors.keys.include? (author.name)
          @authors[author.name] = {
            legislatives: @authors[author.name][:legislatives] += 1,
            risk_sum: @authors[author.name][:risk_sum] += risk,
            risk_count: @authors[author.name][:risk_count] += 1
          }
        else
          @authors[author.name] = {
            legislatives: 1,
            risk_sum: risk,
            risk_count: 1
          }
        end
      end
    end

    @authors.each do |key, author|
      if author[:legislatives] == 1
        risk = ((author[:risk_sum] / author[:risk_count]) * 0.75).ceil
      else
        risk = (author[:risk_sum] / author[:risk_count]).ceil
      end
      author[:risk] = risk
    end

    @authors = @authors.sort_by { |key, author| -author[:risk] }.take(10)

    @speakers = {}
    legislatives.as_speaker.each do |legislative|
      legislative.stakeholders.speakers.each do |speaker|
        risk_list = []

        probability, impact = legislative.probability, legislative.comments.where(user: user).average(:impact).to_i
        risk = impact ? risk_table[[probability, impact]].to_i : 0
        # if impact
        #   risk = risk_table[[probability, impact]].to_i
        # else
        #   risk = 0
        # end

        if @speakers.keys.include? (speaker.name)
          @speakers[speaker.name] = {
            legislatives: @speakers[speaker.name][:legislatives] += 1,
            risk_sum: @speakers[speaker.name][:risk_sum] += risk,
            risk_count: @speakers[speaker.name][:risk_count] += 1
          }
        else
          @speakers[speaker.name] = {
            legislatives: 1,
            risk_sum: risk,
            risk_count: 1
          }
        end
      end
    end

    @speakers.each do |key, speaker|
      if speaker[:legislatives] == 1
        risk = ((speaker[:risk_sum] / speaker[:risk_count]) * 0.75).ceil
      else
        risk = (speaker[:risk_sum] / speaker[:risk_count]).ceil
      end
      speaker[:risk] = risk
    end

    @speakers = @speakers.sort_by { |key, speaker| -speaker[:risk] }.take(10)

    @users = User.clients

    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  # Export legislatives to Excel
  def legislative
    risk_list = []
    risk_table = get_risk_table
    type = ''

    @legislatives = []

    legislatives = Legislative.joins(:stakeholders).select('legislatives.*').group('legislatives.id')

    @q = Agenda.includes(:legislative).ransack params[:q]
    agendas = []

    legislatives_with_agendas = nil
    if /\A\d+\z/.match(params[:client]) && current_user.has_role?(:admin)
      client_user = User.find(params[:client])
      legislatives = legislatives.where(id: client_user.following_legislatives.all.ids)
      type = 'client_' + client_user.name.parameterize.underscore
      legislatives_with_agendas = client_user.following_legislatives.with_agenda.order(created_at: :desc)
    elsif params[:client] === 'false' && current_user.has_role?(:admin)
      type = 'admin_general'
      legislatives_with_agendas = current_user.following_legislatives.with_agenda.order(created_at: :desc)
    else
      # @q = current_user.following_legislatives.includes(:legislative, :comments).ransack params[:q]
      # @legislatives = @q.result.to_a - current_user.find_disliked_items
      legislatives = legislatives.where(id: current_user.following_legislatives.all.ids)
      type = 'client_' + current_user.name.parameterize.underscore
      legislatives_with_agendas = current_user.following_legislatives.with_agenda.order(created_at: :desc)
    end

    # Get all comments/stakeholders eagle for better database performance
    legislatives_comments = Comment.where(legislative_id: legislatives.ids, user_id: current_user).to_a

    stakeholders_authors = legislatives.select('array_agg(stakeholders.name) as author_name').where(legislative_stakeholders: {author: true}).to_a
    stakeholders_speakers = legislatives.select('array_agg(stakeholders.name) as speaker_name').where(legislative_stakeholders: {speaker: true}).to_a

    @q.result.each do |item|
      legislatives_with_agendas.each do |legislative|
        agendas << item if legislative.agendas.status_active.include? item
      end
    end

    # Build response
    legislatives.each do |legislative|
      comments = legislatives_comments.select{ |c| c.legislative_id == legislative.id }
      impacts = comments.collect{ |c| c.impact }

      probability = legislative.probability
      impact_avg = (impacts ? impacts.inject{ |sum, el| (sum ||=0) + (el ||= 0) }.to_i / (impacts.size.nonzero? || 1) : 0)

      risk = risk_table[[probability, impact_avg]].to_i
      risk_list << risk

      authors = stakeholders_authors.reduce([]){ |vals, sa|
        if sa.id == legislative.id
          vals.push(sa.author_name)
          stakeholders_authors.delete_at(stakeholders_authors.index(sa))
          break vals
        end
        vals
      }
      speakers = stakeholders_speakers.reduce([]){ |vals, ss|
        if ss.id == legislative.id
          vals.push(ss.speaker_name)
          stakeholders_speakers.delete_at(stakeholders_speakers.index(ss))
          break vals
        end
        vals
      }

      observation = comments.first
      observation = observation ? observation.body : ''

      # Aggendas Stuff
      legislative_agenda = agendas.find { |agenda| agenda.legislative_id == legislative.id }
      event_at = ''
      event_hour = ''
      plenary_commission = ''
      day_order = ''
      event_type = ''
      if legislative_agenda.present?
        event_at = legislative_agenda.event_at.strftime('%d/%m/%Y')
        event_hour = legislative_agenda.time.strftime('%H:%M %p')
        plenary_commission = legislative_agenda.plenary_commission
        day_order = legislative_agenda.body
        event_type = legislative_agenda.event_type
      end
      # End

      @legislatives << {
        id: legislative.id,
        topic: legislative.topic,
        source: legislative.source,
        chamber_number: legislative.chamber_number,
        senate_number: legislative.senate_number,
        commission: legislative.commission,
        title: legislative.title,
        created_at: legislative.created_at.strftime('%d/%m/%Y'),
        filing_at: legislative.filing_at.strftime('%d/%m/%Y'),
        authors: authors.join(', '),
        speakers: speakers.join(', '),
        chamber_commission_at: legislative.chamber_commission_at ? legislative.chamber_commission_at.strftime('%d/%m/%Y') : '',
        chamber_plenary_at: legislative.chamber_plenary_at ? legislative.chamber_plenary_at.strftime('%d/%m/%Y') : '',
        senate_commission_at: legislative.senate_commission_at ? legislative.senate_commission_at.strftime('%d/%m/%Y') : '',
        senate_plenary_at: legislative.senate_plenary_at ? legislative.senate_plenary_at.strftime('%d/%m/%Y') : '',
        second_chamber_commission_at: legislative.second_chamber_commission_at ? legislative.second_chamber_commission_at.strftime('%d/%m/%Y') : '',
        second_chamber_plenary_at: legislative.second_chamber_plenary_at ? legislative.second_chamber_plenary_at.strftime('%d/%m/%Y') : '',
        second_senate_commission_at: legislative.second_senate_commission_at ? legislative.second_senate_commission_at.strftime('%d/%m/%Y') : '',
        second_senate_plenary_at: legislative.second_senate_plenary_at ? legislative.second_senate_plenary_at.strftime('%d/%m/%Y') : '',
        chamber_settlement_at: legislative.chamber_settlement_at ? legislative.chamber_settlement_at.strftime('%d/%m/%Y') : '',
        senate_settlement_at: legislative.senate_settlement_at ? legislative.senate_settlement_at.strftime('%d/%m/%Y') : '',
        status: (legislative.final_status && legislative.final_status != '') ? legislative.final_status : legislative.status,
        event_at: event_at,
        event_hour: event_hour,
        plenary_commission: plenary_commission,
        day_order: day_order,
        event_type: event_type,
        impact: impact_avg,
        probability: probability,
        risk: risk,
        observations: observation
      }
    end

    respond_to do |format|
      format.xlsx { render xlsx: 'legislative', filename: "legislative_#{type}_#{Time.now.strftime("%d-%m-%Y-%H-%M")}.xlsx" }
    end
  end

  def manual_weekly_report
    UserMailer.set_recipients_weekly
    redirect_to :back, :notice => t('.notice')
  end

  def legislatives_by_stakeholder
    add_breadcrumb "Proyectos por Congresista", :councils_path
    @stakeholders = Stakeholder.unscoped.select(:email).group(:email).having("count(*) > 1")
  end

  private
  def get_legislative(id)
    Legislative.find id
  end

  def get_institutions
    @institutions = Institution.active.includes(:sector).all
  end

  def track_follow(user, legislative)
    currently_followed = UserFollowedLegislative.where(user: user, legislative: legislative).last
    unless currently_followed.present?
      UserFollowedLegislative.create(user: user, legislative: legislative, followed: true, unfollowed: false, follow_date: Time.now)
    end
  end

  def track_unfollow(user, legislative)
    currently_unfollowed = UserFollowedLegislative.where(user: user, legislative: legislative).last
    unless currently_unfollowed.present?
      UserFollowedLegislative.create(user: user, legislative: legislative, followed: false, unfollowed: true, unfollow_date: Time.now)
    end
  end
end
