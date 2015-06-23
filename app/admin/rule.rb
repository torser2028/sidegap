ActiveAdmin.register Rule do
  menu label: "Normas", parent: "Normas en Proceso de Consulta", priority: 0
  actions :all, except: [:destroy]

  permit_params :title, :kind, :institution_id, :filing_at, :deadline_comments,
    attachments_attributes: [:id, :_destroy, :attachment, :title, :published_at]

  filter :title, label: "Titulo"
  filter :kind, label: "Tipo de Norma", as: :select, collection: -> { Kind.rules.pluck(:name) }
  filter :institution, label: "Institución", as: :select, collection: -> { Institution.rules }
  filter :filing_at, label: "Fecha"

  index do
    selectable_column
    column "Titulo", :title
    column "Tipo de Norma", :kind
    column "Institución", :institution
    column "Fecha" do |rule|
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
        row "Fecha" do
          ldate rule.filing_at
        end
        row "Fecha Limite para Comentarios" do
          ldate rule.deadline_comments
        end
        row "Archivos Adjuntos" do
          ul do
            rule.attachments.each do |a|
              li do
                link_to a.title, a.attachment.url
              end
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
      f.input :filing_at, label: "Fecha", as: :datepicker
      f.input :deadline_comments, label: "Fecha Limite para Comentarios", as: :datepicker
    end
    f.inputs "Archivos Adjuntos" do
      f.has_many :attachments, heading: "", allow_destroy: true, new_record: "Agregar Archivo" do |la|
        la.input :title, label: "Titulo"
        la.input :published_at, as: :datepicker, label: "Fecha"
        la.input :attachment, label: ""
      end
    end
    f.actions
  end
end