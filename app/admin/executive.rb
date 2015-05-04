ActiveAdmin.register Executive do
  menu label: "Normas", parent: "Rama Ejecutiva", priority: 0
  actions :all, except: [:destroy]

  permit_params :title, :number, :kind, :institution, :filing_at,
    attachments_attributes: [:id, :_destroy, :attachment, :title, :published_at]

  filter :title, label: "Titulo"
  filter :number, label: "Número"
  filter :kind, label: "Tipo de Norma"
  filter :institution, label: "Institución"
  filter :filing_at, label: "Fecha"

  index do
    selectable_column
    column "Número", :number
    column "Titulo", :title
    column "Tipo de Norma", :kind
    column "Institución", :institution
    column "Fecha", :filing_at
    actions
  end

  show title: "Detalle de la Norma" do |executive|
    panel "Detalles" do
      attributes_table_for executive do
        row "Número" do
          executive.number
        end
        row "Titulo" do
          executive.title
        end
        row "Tipo de Norma" do
          executive.kind
        end
        row "Institución" do
          executive.institution
        end
        row "Fecha" do
          executive.filing_at
        end
        row "Archivos Adjuntos" do
          ul do
            executive.attachments.each do |a|
              li do
                link_to a.attachment.file.filename, a.attachment.url
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
      f.input :number, label: "Número"
      f.input :title, label: "Titulo", input_html: { rows: 5 }
      f.input :kind, label: "Tipo de Norma"
      f.input :institution, label: "Institución"
      f.input :filing_at, label: "Fecha", as: :datepicker
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