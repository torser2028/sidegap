class CouncilsController < ApplicationController
  add_breadcrumb "Concejo de Bogotá", :councils_path

  def index
    add_breadcrumb "Bandeja de Proyectos", :councils_path
    @q = Council.ransack params[:q]
    not_available_councils = current_user.find_disliked_items + current_user.following_councils
    @councils = @q.result.order(created_at: :desc).to_a - not_available_councils
  end

  def projects_approved
    add_breadcrumb "Proyectos - Aprobado", :projects_approved_councils_path
    @q = Council.approved.ransack params[:q]
    @councils = @q.result.order(created_at: :desc)
    @followed = current_user.following_councils
    @downvoted = current_user.find_disliked_items
  end

  def projects_old
    add_breadcrumb "Proyectos - Archivado y Retirado", :projects_old_councils_path
    @q = Council.old.ransack params[:q]
    @councils = @q.result.order(created_at: :desc)
    @followed = current_user.following_councils
    @downvoted = current_user.find_disliked_items
  end

  def favorites
    add_breadcrumb "Mis Favoritos", :favorites_councils_path
    @q = current_user.following_councils.ransack params[:q]
    @councils = @q.result.order(created_at: :desc).to_a - current_user.find_disliked_items
  end

  def trash
    add_breadcrumb "Papelera", :trash_councils_path
    @q = Council.ransack params[:q]
    @councils = current_user.get_down_voted(Council).to_a
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
    @users = User.all.map{|u| ["#{u.name}", u.id] if u.role_ids.include?(2)}.compact
    @users.prepend(['', 0])
    @user_id = @users[0][1]

    @councils = []
    
    if request.post?
      if params[:client] != '0'
        @user_id = params[:client]
        user = User.find(@user_id)
        @councils = user.following_councils
      end
    end
  end

  def observation
    @council = Council.find params[:council_id]

    if request.post?
      @council.observation = params[:observation]
      @council.save

      redirect_to report_councils_path
    end
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
      observation = council.comments.find_by(user_id: current_user)
      observation = observation ? observation.body : ''

      @councils << {
        title: council.title,
        number: council.number,
        commission: council.commission,
        status: council.status,
        topic: council.topic,
        aval: council.aval ? 'SÍ' : 'NO',
        warning: council.warning ? 'SÍ' : 'NO',
        created_at: council.created_at.strftime('%d %b %Y'),
        filing_at: council.filing_at ? council.filing_at.strftime('%d %b %Y') : '',
        monitoring_at: council.monitoring_at ? council.monitoring_at.strftime('%d %b %Y') : '',
        commission_at: council.commission_at ? council.commission_at.strftime('%d %b %Y') : '',
        plenary_at: council.plenary_at ? council.plenary_at.strftime('%d %b %Y') : '',
        authors: council.councillors.authors.map { |author| author.name }.join(', '),
        speakers: council.councillors.speakers.map { |speaker| speaker.name }.join(', '),
        city: 'Bogotá',
        observation: observation
      }
    end
  end

  def projects_by_council
    add_breadcrumb "Bandeja de Proyectos", :councils_path
    @councillors = Councillor.includes(:councils).all
  end

  private
    def get_council(id)
      Council.find id
    end
end
