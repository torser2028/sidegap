class RulesController < InheritedResources::Base
  add_breadcrumb "Normas en Proceso de Consulta", :rules_path

  skip_before_filter :authenticate_user!, only: :show

  def index
    add_breadcrumb "Bandeja de Normas", :rules_path
    @q = Rule.active.ransack params[:q]
    @rules = @q.result.order(created_at: :desc).to_a - current_user.following_rules
  end

  def inactive
    add_breadcrumb "Bandeja de Normas Pasadas", :inactive_rules_path
    @q = Rule.inactive.ransack params[:q]
    @rules = @q.result.order(created_at: :desc)
  end

  def favorites
    add_breadcrumb "Mis Normas Favoritas", :favorites_rules_path
    @q = current_user.following_rules.active.includes(:institution).ransack params[:q]
    @rules = @q.result.order(created_at: :desc).to_a - current_user.find_disliked_items
  end

  def show
    add_breadcrumb 'Detalle de la Norma', :rule_path
    @rule = get_rule params[:id]
    @comment = Comment.where(user: current_user, rule: @rule).first_or_initialize
  end

  def follow
    @rule = get_rule params[:id]
    current_user.follow @rule
    redirect_to :back
  end

  def unfollow
    @rule = get_rule params[:id]
    current_user.stop_following @rule
    redirect_to :back
  end

  def notifications
    add_breadcrumb "Notificaciones", :notifications_rules_path
    @institutions = Institution.rules
    @notifications = current_user.user_notifications
  end

  def export_xls
    case params[:type]
    when 'daily'
      @rules = Rule.where(filing_at: Date.today).all
      filename = "#{Date.today.strftime('%Y-%m-%d')}-Normas-Diario.xlsx"
    when 'active'
      @rules = Rule.active
      filename = "#{Date.today.strftime('%Y-%m-%d')}-Normas-Activas.xlsx"
    when 'all'
      @rules = Rule.all
      filename = "#{Date.today.strftime('%Y-%m-%d')}-Normas-Todas.xlsx"
    end

    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename='+filename
      }
    end
  end

  private
    def get_rule(id)
      Rule.find id
    end
end
