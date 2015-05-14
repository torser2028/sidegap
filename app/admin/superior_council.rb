ActiveAdmin.register SuperiorCouncil do
  menu label: "Consejo Superior de la Judicatura", parent: "Rama Judicial", priority: 2
  actions :all, except: [:destroy]

  permit_params :title, :number, :kind, :filing_at, :court, :room,
    attachments_attributes: [:id, :_destroy, :attachment, :title, :published_at]

  filter :title, label: "Titulo"
  filter :number, label: "Número"
  filter :kind, label: "Tipo de Acción", as: :select, collection: -> { Kind.judicials.pluck(:name) }
  filter :court, label: "Corte"
  filter :filing_at, label: "Fecha"

  index do
    selectable_column
    column "Número", :number
    column "Titulo", :title
    column "Tipo de Acción", :kind
    column "Corte", :court
    column "Fecha", :filing_at
    actions
  end

  show title: "Detalle de la Provincia" do |judicial|
    panel "Detalles" do
      attributes_table_for judicial do
        row "Número" do
          judicial.number
        end
        row "Titulo" do
          judicial.title
        end
        row "Tipo de Acción" do
          judicial.kind
        end
        row "Corte" do
          judicial.court
        end
        row "Fecha" do
          judicial.filing_at
        end
        row "Archivos Adjuntos" do
          ul do
            judicial.attachments.each do |a|
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
      f.input :number, label: "Número"
      f.input :title, label: "Titulo", input_html: { rows: 5 }
      f.input :kind, label: "Tipo de Acción", collection: Kind.judicials.pluck(:name)
      # f.input :court, label: "Corte", collection: option_groups_from_collection_for_select(Sector.all.includes(:institutions), :institutions, :name, :id, :name)
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

