ActiveAdmin.register Rule do
  menu label: "Normas", parent: "Normas en Proceso de Consulta", priority: 0

  permit_params :title, :kind, :institution_id, :filing_at, :deadline_comments, :for_comments,
    attachments_attributes: [:id, :_destroy, :attachment, :title, :published_at]

  exclude_fields :id

  filter :title, label: "Titulo"
  filter :kind, label: "Tipo de Norma", as: :select, collection: -> { Kind.rules.pluck(:name) }
  filter :institution, label: "Institución", as: :select, collection: -> { Institution.rules }
  filter :filing_at, label: "Fecha de Creación"

  scope "Próximas Normas", :active
  scope "Normas Pasadas", :inactive

  index title: "Normas" do
    selectable_column
    column "Titulo", :title
    column "Tipo de Norma", :kind
    column "Institución", :institution
    column "Fecha de Creación" do |rule|
      ldate rule.filing_at
    end
    actions
  end

  show title: "Detalle de la Norma" do |rule|
    panel "Detalles" do
      attributes_table_for rule do
        row "Titulo" do
          rule.title
        end
        row "Tipo de Norma" do
          rule.kind
        end
        row "Sector" do
          rule.institution.sector
        end
        row "Institución" do
          rule.institution
        end
        row "Fecha de Creación" do
          ldate rule.filing_at
        end
        row "Fecha Limite para Comentarios" do
          ldate rule.deadline_comments
        end
        row "Comentarios / Sugerencias" do
          rule.for_comments
        end
        row "Archivos Adjuntos" do
          table_for rule.attachments do
            column "Nombre", :title do |a|
              link_to a.title, a.attachment.url
            end
            column "Fecha", :published_at do |a|
              ldate a.published_at
            end
          end
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :title, label: "Titulo", input_html: { rows: 5 }
      f.input :kind, label: "Tipo de Norma", collection: Kind.rules.pluck(:name)
      f.input :institution, label: "Institución", collection: Institution.rules
      f.input :filing_at, label: "Fecha de Creación", as: :datepicker
      f.input :deadline_comments, label: "Fecha Limite para Comentarios", as: :datepicker
      f.input :for_comments, label: "Comentarios / Sugerencias", placeholder: "Email / Teléfono"
    end
    f.inputs "Archivos Adjuntos" do
      f.has_many :attachments, heading: "", allow_destroy: true, new_record: "Agregar Archivo" do |la|
        la.input :title, label: "Titulo"
        la.input :published_at, as: :datepicker, label: "Fecha"
        la.input :attachment, label: ""
      end
    end
    f.actions do
      f.action :submit, label: "Guardar Norma"
      li class: "cancel" do
        link_to "Cancelar", admin_rules_path
      end
    end
  end

  controller do
    def new
      @page_title = "Agregar Norma"
      super
    end

    def edit
      @page_title = "Editar Norma"
    end
  end


end
