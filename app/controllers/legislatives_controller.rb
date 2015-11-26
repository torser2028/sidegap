class LegislativesController < ApplicationController
  add_breadcrumb "Rama Legislativa", :legislatives_path

  def index
    add_breadcrumb "Bandeja de Proyectos", :legislatives_path

    @q = Legislative.inbox.ransack params[:q]
    @legislatives = []
    not_available_legislatives = current_user.find_disliked_items + current_user.following_legislatives
    @q.result.each do |item|
      @legislatives << item unless not_available_legislatives.include? item
    end
  end

  def projects_law
    add_breadcrumb "Proyectos - Ley", :projects_law_legislatives_path

    @q = Legislative.law.ransack params[:q]
    @legislatives = @q.result
  end

  def projects_old
    add_breadcrumb "Proyectos - Archivado y Retirado", :projects_old_legislatives_path

    @q = Legislative.old.ransack params[:q]
    @legislatives = @q.result
  end

  def favorites
    add_breadcrumb "Mis Favoritos", :favorites_legislatives_path

    @q = current_user.following_legislatives.ransack params[:q]
    @legislatives = []
    @q.result.each do |item|
      @legislatives << item unless current_user.find_disliked_items.include? item
    end
  end

  def trash
    add_breadcrumb "Papelera", :trash_legislatives_path

    @q = Legislative.ransack params[:q]
    @legislatives = []
    @q.result.each do |item|
      @legislatives << item if current_user.find_disliked_items.include? item
    end
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
      @q = Agenda.ransack params[:q]
      @events = Event.ransack(params[:q]).result
    else
      @q = Agenda.ransack params[:q]
      @events = Event.active
    end
    @agendas = []
    @legislatives = current_user.following_legislatives.with_agenda
    @q.result.each do |item|
      @legislatives.each do |legislative|
        @agendas << item if legislative.agendas.include? item
      end
    end
  end

  def events_commission
    @q = Legislative.ransack params[:q]
    @agendas = []
    @q.result.each do |item|
      item.agendas.active.each { |agenda| @agendas << agenda  }
    end
  end

  def follow
    @legislative = get_legislative params[:id]
    current_user.follow @legislative
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

  def stakeholders
    add_breadcrumb "Congresistas", :stakeholders_legislatives_path

    @q = Stakeholder.ransack params[:q]
    @stakeholders = @q.result
  end

  def stakeholder
    add_breadcrumb "Pérfil Congresista", :stakeholder_legislatives_path

    @stakeholder = Stakeholder.find params[:id]
    @legislatives_as_author = @stakeholder.legislatives.as_author
    @legislatives_as_speaker = @stakeholder.legislatives.as_speaker

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "perfil #{@stakeholder.name}".parameterize
      end
    end
  end

  def risk_color risk
    return 'blue' if risk < 5
    return 'yellow' if risk < 18
    return 'orange' if risk < 32
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
    risk_table = get_risk_table

    # Summary Week
    @summary_week = Notice.where(user_id: current_user)

    # Events
    @today = Date.today
    @last_week = @today-1.week
    @last_events = Event.where(event_at: @last_week..@today)
    
    @next_week = @today+1.week
    @next_events = Event.where(event_at: @today..@next_week)

    # Risk and projects
    risk_list = []

    @legislatives = []
    Legislative.all.each do |legislative|
      probability, impact = legislative.probability, legislative.comments.average(:impact).to_i
      risk = risk_table[[probability, impact]].to_i

      risk_list << risk
      
      @legislatives << {
        risk: risk,
        status: legislative.status,
        topic: legislative.topic,
        title: legislative.title,
      }
    end

    @legislatives_by_risk = risk_list.sort.inject(Hash.new(0)) {|count, risk| count[risk] +=1; count}.to_a
    @legislatives_by_risk.each do |element|
      element << risk_color(element[0])
    end
    
    @legislatives_by_topic = Legislative.group(:topic).count
    @total_by_topic = @legislatives_by_topic.values.sum
    
    @legislatives_by_status = Legislative.group(:status).count
    @total_by_status = @legislatives_by_status.values.sum
    
    @legislatives_by_source = Legislative.group(:source).count
    @total_by_source = @legislatives_by_source.values.sum

    # Authors and speakers
    authors = Stakeholder.authors
    senate_authors = Stakeholder.senate_authors
    chamber_authors = Stakeholder.chamber_authors
    authors = authors + senate_authors + chamber_authors

    @authors = []
    authors.each do |author|
      risk_list = []
      author.legislatives.each do |legislative|
        probability, impact = legislative.probability, legislative.comments.average(:impact).to_i
        risk_list << risk_table[[probability, impact]].to_i
      end
      @authors << {
        legislatives: author.legislatives.count,
        name: author.name,
        risk: risk_list.sum / risk_list.count
      }
    end

    senate_speakers = Stakeholder.senate_speakers
    chamber_speakers = Stakeholder.chamber_speakers
    speakers = senate_speakers + chamber_speakers

    @speakers = []
    speakers.each do |speaker|
      risk_list = []
      speaker.legislatives.each do |legislative|
        probability, impact = legislative.probability, legislative.comments.average(:impact).to_i
        risk_list << risk_table[[probability, impact]].to_i
      end
      @speakers << {
        legislatives: speaker.legislatives.count,
        name: speaker.name,
        risk: risk_list.sum / risk_list.count
      }
    end

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "informe-legislativo", orientation: 'Landscape'
      end
    end
  end

  private
    def get_legislative(id)
      Legislative.find id
    end
end
