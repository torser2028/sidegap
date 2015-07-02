ActiveAdmin.register Institution do
  menu label: "Instituciones", parent: "Normas en Proceso de Consulta", priority: 1

  permit_params :sector_id, :name, :rule

  filter :sector
  filter :name, label: "Nombre"

  index title: "Instituciones" do
    selectable_column
    column :sector
    column "Nombre", :name
    actions
  end

  show title: "Detalle de la Institución" do |institution|
    panel "Detalles" do
      attributes_table_for institution do
        row :sector
        row "Nombre" do
          institution.name
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
