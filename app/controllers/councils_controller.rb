class CouncilsController < ApplicationController
  add_breadcrumb "Concejo de Bogotá", :councils_path

  def index
    add_breadcrumb "Bandeja de Proyectos", :councils_path

    @q = Council.ransack params[:q]
    @councils = []
    not_available_councils = current_user.find_disliked_items + current_user.following_councils
    @q.result.order(created_at: :desc).each do |item|
      @councils << item unless not_available_councils.include? item
    end
  end

  def projects_approved
    add_breadcrumb "Proyectos - Aprobado", :projects_approved_councils_path

    @q = Council.approved.ransack params[:q]
    @councils = @q.result.order(created_at: :desc)
  end

  def projects_old
    add_breadcrumb "Proyectos - Archivado y Retirado", :projects_old_councils_path

    @q = Council.old.ransack params[:q]
    @councils = @q.result.order(created_at: :desc)
  end

  def favorites
    add_breadcrumb "Mis Favoritos", :favorites_councils_path

    @q = current_user.following_councils.ransack params[:q]
    @councils = []
    @q.result.order(created_at: :desc).each do |item|
      @councils << item unless current_user.find_disliked_items.include? item
    end
  end

  def trash
    add_breadcrumb "Papelera", :trash_councils_path

    @q = Council.ransack params[:q]
    @councils = []
    @q.result.each do |item|
      @councils << item if current_user.find_disliked_items.include? item
    end
  end

  def show
    add_breadcrumb "Proyecto", :council_path

    @council = get_council params[:id]
    @authors = @council.councillors.authors
    @speakers = @council.councillors.speakers
    @attachments = @council.attachments

    @comment = Comment.where(user: current_user, council: @council).first_or_initialize

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "concejo-detalle-de-proyecto"
      end
    end
  end

  def follow
    @council = get_council params[:id]
    current_user.follow @council
    redirect_to :back
  end

  def unfollow
    @council = get_council params[:id]
    current_user.stop_following @council
    redirect_to :back
  end

  def dislike
    @council = get_council params[:id]
    current_user.dislikes @council
    redirect_to :back
  end

  def like
    @council = get_council params[:id]
    current_user.likes @council
    redirect_to :back
  end

  def councillors
    add_breadcrumb "Concejales", :councillors_councils_path

    @q = Councillor.ransack params[:q]
    @councillors = @q.result
  end

  def councillor
    add_breadcrumb "Pérfil Concejal", :councillor_councils_path

    @councillor = Councillor.find params[:id]
    @councils_as_author = @councillor.councils.as_author
    @councils_as_speaker = @councillor.councils.as_speaker

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "perfil #{@councillor.name}".parameterize
      end
    end
  end

  def report
  end

  # Export councils to Excel
  def council
    @councils = []
    
    if current_user.has_role? :admin
      councils = Council.all
    else
      councils = current_user.following_councils
    end

    councils.each do |council|
      @councils << {
        title: council.title,
        number: council.number,
        commission: council.commission,
        status: council.status,
        title: council.title,
        aval: council.aval ? 'SÍ' : 'NO',
        warning: council.warning ? 'SÍ' : 'NO',
        created_at: council.created_at.strftime('%d %b %Y'),
        filing_at: council.filing_at ? council.filing_at.strftime('%d %b %Y') : '',
        monitoring_at: council.monitoring_at ? council.monitoring_at.strftime('%d %b %Y') : '',
        authors: '',
        speakers: ''
      }
    end
  end

  private
    def get_council(id)
      Council.find id
    end
end
