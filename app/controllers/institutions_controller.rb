class InstitutionsController < InheritedResources::Base
  add_breadcrumb 'Rama Legislativa'

  def show
    add_breadcrumb 'Instituciones'
    @institution = Institution.includes(:sector, :rules).find(params[:id])
  end
end
