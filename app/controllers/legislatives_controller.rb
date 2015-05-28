class LegislativesController < ApplicationController
  add_breadcrumb "Rama Legislativa", :legislatives_path

  def index
    add_breadcrumb "Bandeja de Proyectos", :legislatives_path

    @q = Legislative.ransack params[:q]
    @legislatives = []
    not_available_legislatives = current_user.find_disliked_items + current_user.following_legislatives
    @q.result.each do |item|
      @legislatives << item unless not_available_legislatives.include? item
    end
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
    @authors = @legislative.stakeholders.authors
    @speakers = @legislative.stakeholders.speakers

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

    @q = Agenda.ransack params[:q]
    @agendas = @q.result
    @events = Event.all
  end

  def follow
    @legislative = get_legislative params[:id]
    current_user.follow @legislative
    redirect_to :back
  end

  def unfollow
    @legislative = get_legislative params[:id]
    current_user.stop_following @legislative
    redirect_to :back
  end

  def dislike
    @legislative = get_legislative params[:id]
    current_user.dislikes @legislative
    redirect_to :back
  end

  def like
    @legislative = get_legislative params[:id]
    current_user.likes @legislative
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

  private
    def get_legislative(id)
      Legislative.find id
    end
end