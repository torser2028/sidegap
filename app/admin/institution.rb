ActiveAdmin.register Institution do
  menu label: "Instituciones", parent: "Normas en Proceso de Consulta", priority: 1

  permit_params :sector_id, :name, :rule, :active

  filter :sector
  filter :name, label: "Nombre"

  scope "Todas", :all, default: true
  scope "Activas", :active
  scope "Inactivas", :inactive

  index title: "Instituciones" do
    selectable_column
    column :sector
    column "Nombre", :name
    column "Activa", :active
    actions
  end

  show title: "Detalle de la Institución" do |institution|
    panel "Detalles" do
      attributes_table_for institution do
        row :sector
        row "Nombre" do
          institution.name
        end
        row "Activa" do
          institution.active ? 'Sí' : 'No'
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :sector
      f.input :name, label: "Nombre"
      f.input :rule, as: :hidden, input_html: { value: true }
      f.input :active, label: "Activa"
    end
    f.actions do
      f.action :submit, label: "Guardar Institución"
      li class: "cancel" do
        link_to "Cancelar", admin_institutions_path
      end
    end
  end

  controller do
    def new
      @page_title = "Agregar Institución"
      super
    end

    def edit
      @page_title = "Editar Institución"
    end
  end
end
