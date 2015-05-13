class JudicialsController < InheritedResources::Base
  before_action :get_model

  add_breadcrumb "Rama Judicial", :preview_judicials_path

  def preview;end

  def index
    add_breadcrumb "Bandeja de Entrada", "#{get_model.underscore.pluralize}_path".to_sym

    @q = juditial_type.ransack params[:q]
    @judicials = @q.result
  end

  private
    def judicial_params
      params.require(:judicial).permit(:title, :number, :kind, :filing_at, :court, :room, :type)
    end

    def get_model
      params[:type] || "Judicial"
    end

    def juditial_type
      get_model.constantize
    end
end

