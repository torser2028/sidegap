ActiveAdmin.register Council do
  menu label: "Proyectos", parent: "Concejo", priority: 0

  permit_params :title, :number, :commission, :status, :filing_at, :warning, :topic, :monitoring_at, :aval,
    councillor_assignments_attributes: [:id, :_destroy, :councillor_id, :author, :speaker],
    attachments_attributes: [:id, :_destroy, :attachment, :title, :published_at]

  filter :title, label: "Titulo"
  filter :number, label: "Número"
  filter :commission, label: "Comisión", as: :select, collection: ->{ Commission.councils.pluck(:name) }
  filter :status, label: "Estado", as: :select, collection: -> { Status.councils.pluck(:name) }
  filter :filing_at, label: "Fecha de Radicación"

  index title: "Proyectos" do
    column "Titulo", :title
    column "Número", :number
    column "Fecha de Radicación" do |council|
      ldate council.filing_at
    end
    column "Mensaje de Urgencia", :warning
    actions() do |council|
      link_to("Stakeholders", stakeholders_admin_council_path(council))
    end
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
          ldate council.updated_at, format: :db
        end
        row "Fecha de Radicación" do
          ldate council.filing_at
        end
        row "Aval" do
          council.aval == true ? "Si" : "No"
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
      f.input :commission, label: "Comisión", collection: Commission.councils.pluck(:name)
      f.input :status, label: "Estado", collection: Status.councils.pluck(:name)
      f.input :topic, label: "Tema de Interes", collection: Topic.pluck(:name)
      f.input :filing_at, label: "Fecha de Radicación", as: :datepicker
      f.input :aval
      f.input :warning, label: "Mensaje de Urgencia"
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
    f.actions do
      f.action :submit, label: "Guardar Proyecto"
      li class: "cancel" do
        link_to "Cancelar", admin_councils_path
      end
    end
  end

  member_action :stakeholders, method: [:get, :post] do
    if request.post?
      authors = params[:stakeholders][:authors].delete_if(&:blank?)
      speakers = params[:stakeholders][:speakers].delete_if(&:blank?)

      resource.councillor_assignments.destroy_all

      authors.each { |councillor_id| resource.councillor_assignments.authors.create!(councillor_id: councillor_id)  }
      speakers.each { |councillor_id| resource.councillor_assignments.speakers.create!(councillor_id: councillor_id)  }

      redirect_to admin_council_path(resource), notice: "Stakeholders guardados con éxito."
    else
      @holders = Councillor.all.map { |c| [c.name, c.id] }
      @authors = resource.councillors.authors.map(&:id)
      @speakers = resource.councillors.speakers.map(&:id)
    end
  end

  action_item :stakeholders, only: :show do
    link_to "Modificar Stakeholders", stakeholders_admin_council_path(council), method: :get
  end

  action_item :pdf, only: :show do
    link_to "Exportar a PDF", council_path(council, format: :pdf), target: :_blank
  end

  controller do
    def new
      @page_title = "Agregar Proyecto"
      super
    end

    def edit
      @page_title = "Editar Proyecto"
    end
  end
end
