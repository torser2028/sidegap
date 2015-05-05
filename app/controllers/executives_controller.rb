class ExecutivesController < InheritedResources::Base
  add_breadcrumb "Rama Ejecutiva", :executives_path

  def index
    add_breadcrumb "Bandeja de Normas", :executives_path

    @q = Executive.ransack params[:q]
    @executives = []
    @q.result.each do |item|
      @executives << item unless current_user.following_executives.include? item
    end
  end

  def favorites
    add_breadcrumb "Mis Normas Favoritas", :favorites_executives_path

    @q = current_user.following_executives.ransack params[:q]
    @executives = []
    @q.result.each do |item|
      @executives << item unless current_user.find_disliked_items.include? item
    end
  end

  def officials
    add_breadcrumb "Altos Funcionarios", :officials_executives_path

    @q = Official.ransack params[:q]
    @officials = @q.result
  end

  def official
    add_breadcrumb "Pérfil Funcionario", :official_executives_path

    @official = Official.find params[:id]

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "perfil #{@official.name}".parameterize
      end
    end
  end

  def show
    add_breadcrumb "Detalle de la Norma", :executive_path

    @executive = get_executive params[:id]
  end

  def follow
    @executive = get_executive params[:id]
    current_user.follow @executive
    redirect_to :back
  end

  def unfollow
    @executive = get_executive params[:id]
    current_user.stop_following @executive
    redirect_to :back
  end

  private
    def get_executive(id)
      Executive.find id
    end
end

