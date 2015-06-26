ActiveAdmin.register Council do
  menu label: "Proyectos", parent: "Concejo", priority: 0
  actions :all, except: [:destroy]

  permit_params :title, :number, :commission, :status, :filing_at, :warning, :topic, :monitoring_at, :aval,
    councillor_assignments_attributes: [:id, :_destroy, :councillor_id, :author, :speaker],
    attachments_attributes: [:id, :_destroy, :attachment, :title, :published_at]

  filter :title, label: "Titulo"
  filter :number, label: "Número"
  filter :commission, label: "Comisión", as: :select, collection: ->{ Commission.pluck(:name) }
  filter :status, label: "Estado", as: :select, collection: -> { Status.councils.pluck(:name) }
  filter :filing_at, label: "Fecha de Radicación"

  index do
    column "Titulo", :title
    column "Número", :number
    column "Fecha de Radicación" do |council|
      ldate council.filing_at
    end
    actions
  end

  show title: "Detalle del Proyecto" do |council|
    panel "Detalles" do
      attributes_table_for council do
        row "Titulo" do
          council.title
        end
        row "Número" do
          council.number
        end
        row "Comisión" do
          council.commission
        end
        row "Estado" do
          council.status
        end
        row "Tema de Interes" do
          council.topic
        end
        row "Fecha de Seguimiento" do
          ldate council.monitoring_at
        end
        row "Fecha de Radicación" do
          ldate council.filing_at
        end
        row "Fecha de Radicación" do
          council.aval
        end

        row "Concejales" do
          table_for council.councillor_assignments do
            column "Nombre", :name do |ca|
              ca.councillor.name
            end
            column "Autor", :author
            column "Ponente", :speaker
          end
        end

        row "Archivos Adjuntos" do
          ul do
            council.attachments.each do |a|
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
      f.input :title, label: "Titulo", as: :text, input_html: { rows: 5 }
      f.input :number, label: "Número"
      f.input :commission, label: "Comisión", collection: Commission.pluck(:name)
      f.input :status, label: "Estado", collection: Status.pluck(:name)
      f.input :topic, label: "Tema de Interes", collection: Topic.pluck(:name)
      f.input :monitoring_at, label: "Fecha de Seguimiento", as: :datepicker
      f.input :filing_at, label: "Fecha de Radicación", as: :datepicker
      f.input :aval
      f.input :warning, label: "Mensaje de Urgencia"
    end
    f.inputs "Concejales" do
      f.has_many :councillor_assignments, heading: "", allow_destroy: true, new_record: "Agregar Concejal" do |ca|
        ca.input :councillor
        ca.input :author, label: "Autor"
        ca.input :speaker, label: "Ponente"
      end
    end
    f.inputs "Archivos Adjuntos" do
      f.has_many :attachments, heading: "", allow_destroy: true, new_record: "Agregar Archivo" do |la|
        la.input :title, label: "Titulo"
        la.input :published_at, as: :datepicker, label: "Fecha"
        la.input :attachment, label: ""
      end
    end
    f.inputs do
      f.input :notify, label: "Envíar notificación?"
    end
    f.actions
  end
end
