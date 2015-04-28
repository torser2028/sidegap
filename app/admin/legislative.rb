ActiveAdmin.register Legislative do
  menu label: "Proyectos", parent: "Rama Legislativa", priority: 0
  actions :all, except: [:destroy]

  permit_params :title, :source, :chamber_number, :senate_number, :commission, :status, :topic, :law, :probability, :chamber_commission_at, :chamber_plenary_at, :senate_commission_at, :senate_plenary_at, :filing_at,
    legislative_attachments_attributes: [:id, :_destroy, :attachment, :title, :published_at],
    legislative_stakeholders_attributes: [:id, :_destroy, :stakeholder_id, :author, :speaker],
    agendas_attributes: [:id, :_destroy, :body, :event_at, :time]


  filter :title, label: "Titulo"
  filter :source, label: "Origen"
  filter :chamber_number, label: "Número de Cámara"
  filter :senate_number, label: "Número de Senado"
  filter :commission, label: "Comisión", as: :select, collection: Commission.pluck(:name)
  filter :status, label: "Estatus", as: :select, collection: Status.pluck(:name)
  filter :probability, label: "Probabilidad", as: :select, collection: Probability.pluck(:name)
  filter :legislative_attachments, label: "Archivos Adjuntos"
  filter :filing_at, label: "Fecha de Radicación"

  index do
    selectable_column
    column "Titulo", :title
    column "Número de Cámara", :chamber_number
    column "Número de Senado", :senate_number
    column "Fecha de Radicación", :filing_at
    actions
  end

  show title: "Detalle del Proyecto" do |legislative|
    panel "Detalles" do
      attributes_table_for legislative do
        row "Titulo" do
          legislative.title
        end
        row "Origen" do
          legislative.source
        end
          
        row "Número de Cámara" do
          legislative.chamber_number
        end
          
        row "Número de Senado" do
          legislative.senate_number
        end
          
        row "Comisión" do
          legislative.commission
        end
          
        row "Estatus" do
          legislative.status
        end
          
        row "Tema de Interes" do
          legislative.topic
        end
          
        row "Tipo de Ley" do
          legislative.law
        end
          
        row "Probabilidad" do
          legislative.probability
        end
          
        row "Fecha Comisión Cámara" do
          legislative.chamber_commission_at
        end
          
        row "Fecha Plenaria Cámara" do
          legislative.chamber_plenary_at
        end
          
        row "Fecha Comisión Senado" do
          legislative.senate_commission_at
        end
          
        row "Fecha Plenaria Senado" do
          legislative.senate_plenary_at
        end
          
        row "Fecha de Radicación" do
          legislative.filing_at
        end

        row "Stakeholders" do
          table_for legislative.legislative_stakeholders do
            column "Nombre", :name do |ls|
              ls.stakeholder.name
            end
            column "Autor", :author
            column "Ponente", :speaker
          end
        end

        row "Archivos Adjuntos" do
          ul do
            legislative.legislative_attachments.each do |la|
              li do
                link_to la.attachment.file.filename, la.attachment.url
              end
            end
          end
        end

        row "Agenda" do
          table_for legislative.agendas do
            column "Fecha", :event_at do |a|
              a.event_at
            end
            column "Hora", :time do |a|
              a.time.to_s(:time)
            end
            column "Descripción", :body
          end
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :title, label: "Titulo", as: :text, input_html: { rows: 5 }
      f.input :source, label: "Origen", collection: Source.pluck(:name)
      f.input :chamber_number, label: "Número de Cámara"
      f.input :senate_number, label: "Número de Senado"
      f.input :commission, label: "Comisión", collection: Commission.pluck(:name)
      f.input :status, label: "Estatus", collection: Status.pluck(:name)
      f.input :topic, label: "Tema de Interes", collection: Topic.pluck(:name)
      f.input :law, label: "Tipo de Ley", collection: Law.pluck(:name)
      f.input :probability, label: "Probabilidad", collection: Probability.pluck(:name)
      f.input :chamber_commission_at, label: "Fecha Comisión Cámara", as: :datepicker
      f.input :chamber_plenary_at, label: "Fecha Plenaria Cámara", as: :datepicker
      f.input :senate_commission_at, label: "Fecha Comisión Senado", as: :datepicker
      f.input :senate_plenary_at, label: "Fecha Plenaria Senado", as: :datepicker
      f.input :filing_at, label: "Fecha de Radicación", as: :datepicker
    end
    f.inputs "Stakeholders" do
      f.has_many :legislative_stakeholders, heading: "", allow_destroy: true, new_record: "Agregar Stakeholder" do |ls|
        ls.input :stakeholder
        ls.input :author, label: "Autor"
        ls.input :speaker, label: "Ponente"
      end
    end
    f.inputs "Archivos Adjuntos" do
      f.has_many :legislative_attachments, heading: "", allow_destroy: true, new_record: "Agregar Archivo" do |la|
        la.input :title, label: "Titulo"
        la.input :published_at, as: :datepicker, label: "Fecha"
        la.input :attachment, label: ""
      end
    end
    f.inputs "Agenda" do
      f.has_many :agendas, heading: "", allow_destroy: true, new_record: "Agregar Agenda" do |a|
        a.input :event_at, as: :datepicker, label: "Fecha"
        a.input :time, label: "Hora"
        a.input :body, label: "Descripción", input_html: { rows: 6 }
      end
    end
    f.actions
  end
end
