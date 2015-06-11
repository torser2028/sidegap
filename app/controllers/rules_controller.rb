class RulesController < InheritedResources::Base
  add_breadcrumb "Normas en Proceso de Consulta", :rules_path

  def index
    add_breadcrumb "Bandeja de Normas", :rules_path

    @q = Rule.ransack params[:q]
    @rules = []
    @q.result.each do |item|
      @rules << item unless current_user.following_rules.include? item
    end
  end

  def favorites
    add_breadcrumb "Mis Normas Favoritas", :favorites_rules_path

    @q = current_user.following_rules.ransack params[:q]
    @rules = []
    @q.result.each do |item|
      @rules << item unless current_user.find_disliked_items.include? item
    end
  end

  def show
    add_breadcrumb "Detalle de la Norma", :rule_path

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

  private
    def get_rule(id)
      Rule.find id
    end
end