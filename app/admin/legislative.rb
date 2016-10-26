ActiveAdmin.register Legislative do
  menu label: "Proyectos", parent: "Rama Legislativa", priority: 0

  filter :title, label: "Titulo"
  filter :source, label: "Origen", as: :select, collection: -> { Source.pluck(:name) }
  filter :chamber_number, label: "Número de Cámara"
  filter :senate_number, label: "Número de Senado"
  filter :commission, label: "Comisión", as: :select, collection: -> { Commission.legislatives.pluck(:name) }
  filter :status, label: "Estado", as: :select, collection: -> { Status.legislatives.pluck(:name) }
  filter :final_status, label: "Estado Final", as: :select, collection: -> { FinalStatus.pluck(:name) }
  filter :probability, label: "Probabilidad", as: :select, collection: -> { Probability.pluck(:name) }
  filter :filing_at, label: "Fecha de Radicación"
  filter :agendas_id_not_null, label: "Agendados", as: :boolean, collection: [["Si", true], ["No", false]]
  filter :warning, label: "Mensaje de Urgencia", collection: [["Si", true], ["No", false]]

  index title: "Proyectos" do
    column "Titulo" do |legislative|
      simple_format legislative.title
    end
    column "Número de Cámara", :chamber_number
    column "Número de Senado", :senate_number
    column "Fecha de Radicación" do |legislative|
      ldate legislative.filing_at
    end
    column "Mensaje de Urgencia", :warning
    column "Proyecto Acumulado" do |legislative|
      value = legislative.legislative.present? ? "yes" : "no"
      span class: "status_tag #{value}" do
        value == "yes" ? "Si" : "No"
      end
    end
    actions() do |legislative|
      link_to("Agendar", schedule_admin_legislative_path(legislative)) + " " +
      link_to("Stakeholders", stakeholders_admin_legislative_path(legislative))
    end
  end

  show title: "Detalle del Proyecto" do |legislative|
    panel "Detalles" do
      attributes_table_for legislative do
        row "Titulo" do
          simple_format legislative.title
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

        row "Estado" do
          legislative.status
        end

        row "Estado Final" do
          legislative.final_status
        end

        row "Número de Ley" do
          legislative.law_number
        end

        row "Tema de Interes" do
          legislative.topic
        end

        row "Tipo de Ley" do
          legislative.type_law
        end

        row "Probabilidad" do
          legislative.probability
        end

        row "Fecha Comisión Cámara" do
          ldate legislative.chamber_commission_at
        end

        row "Fecha Plenaria Cámara" do
          ldate legislative.chamber_plenary_at
        end

        row "Fecha Comisión Senado" do
          ldate legislative.senate_commission_at
        end

        row "Fecha Plenaria Senado" do
          ldate legislative.senate_plenary_at
        end

        row "Fecha Segunda Vuelta Comisión Cámara" do
          ldate legislative.second_chamber_commission_at
        end

        row "Fecha Segunda Vuelta Plenaria Cámara" do
          ldate legislative.second_chamber_plenary_at
        end

        row "Fecha Segunda Vuelta Comisión Senado" do
          ldate legislative.second_senate_commission_at
        end

        row "Fecha Segunda Vuelta Plenaria Senado" do
          ldate legislative.second_senate_plenary_at
        end

        row "Fecha de Radicación" do
          ldate legislative.filing_at
        end

        row "Fecha Conciliación Cámara" do
          ldate legislative.chamber_settlement_at
        end

        row "Fecha Conciliación Senado" do
          ldate legislative.senate_settlement_at
        end

        row "Archivos Adjuntos" do
          attachments = legislative.attachments
          attachments += legislative.legislative.try(:attachments) if legislative.legislative
          table_for attachments do
            column "Nombre", :title do |a|
              link_to a.title, a.attachment.url
            end
            column "Fecha", :published_at do |a|
              ldate a.published_at
            end
          end
        end

        row "Agenda" do
          table_for legislative.agendas do
            column "Fecha", :event_at do |a|
              ldate a.event_at
            end
            column "Hora", :time do |a|
              l a.time, format: :simple
            end
            column "Descripción", :body
            column "Tipo de evento", :event_type
            column "Observación", :observation
          end
        end

        if legislative.legislatives.present?
          row "Proyectos Acumulados" do
            ul do
              legislative.legislatives.each do |l|
                li do
                  link_to l.chamber_number.present? ? l.chamber_number : l.senate_number, admin_legislative_path(l.id)
                end
              end
            end
          end
        end

        if legislative.legislative.present?
          row "Acumulado" do
            ul do
              li do
                link_to legislative.legislative.chamber_number.present? ? legislative.legislative.chamber_number : legislative.legislative.senate_number, admin_legislative_path(legislative.legislative.id)
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
      f.input :source, label: "Origen", collection: Source.pluck(:name)
      f.input :chamber_number, label: "Número de Cámara"
      f.input :senate_number, label: "Número de Senado"
      f.input :commission, label: "Comisión", collection: Commission.legislatives.pluck(:name)
      f.input :status, label: "Estado", collection: Status.legislatives.pluck(:name)
      f.input :final_status, label: "Estado Final", collection: FinalStatus.pluck(:name)
      f.input :topic, label: "Tema de Interes", collection: Topic.legislatives.pluck(:name)
      f.input :type_law, label: "Tipo de Ley", collection: Law.pluck(:name)
      f.input :probability, label: "Probabilidad", as: :select, collection: Probability.pluck(:name)
      f.input :chamber_commission_at, label: "Fecha Comisión Cámara", as: :datepicker
      f.input :chamber_plenary_at, label: "Fecha Plenaria Cámara", as: :datepicker
      f.input :senate_commission_at, label: "Fecha Comisión Senado", as: :datepicker
      f.input :senate_plenary_at, label: "Fecha Plenaria Senado", as: :datepicker
      f.input :second_chamber_commission_at, label: "Fecha Segunda Vuelta Comisión Cámara", as: :datepicker
      f.input :second_chamber_plenary_at, label: "Fecha Segunda Vuelta Plenaria Cámara", as: :datepicker
      f.input :second_senate_commission_at, label: "Fecha Segunda Vuelta Comisión Senado", as: :datepicker
      f.input :second_senate_plenary_at, label: "Fecha Segunda Vuelta Plenaria Senado", as: :datepicker
      f.input :filing_at, label: "Fecha de Radicación", as: :datepicker
      f.input :chamber_settlement_at, label: "Fecha Conciliación Cámara", as: :datepicker
      f.input :senate_settlement_at, label: "Fecha Conciliación Senado", as: :datepicker
      f.input :warning, label: "Mensaje de Urgencia"
    end
    f.inputs do
      f.input :law_number, label: "Número de Ley / Número de Acto Legislativo"
    end
    unless f.object.new_record?
      f.inputs "Proyectos Acumulados" do
        f.has_many :legislatives, heading: "", allow_destroy: true, new_record: "Agregar acumulado" do |l|
          l.input :title, label: "Titulo", as: :text, input_html: { rows: 5 }
          l.input :chamber_number, label: "Número de Cámara"
          l.input :senate_number, label: "Número de Senado"
          l.input :filing_at, label: "Fecha de Radicación", as: :datepicker
          l.input :source, as: :hidden, input_html: { value: f.object.source }
          l.input :status, as: :hidden, input_html: { value: f.object.status }
          l.input :topic, as: :hidden, input_html: { value: f.object.topic }
          l.input :type_law, as: :hidden, input_html: { value: f.object.type_law }
          l.input :law_number, as: :hidden, input_html: { value: f.object.law_number }
          l.input :final_status, as: :hidden, input_html: { value: f.object.final_status }
        end
      end
    end
    f.inputs "Archivos Adjuntos" do
      f.has_many :attachments, heading: "", allow_destroy: true, new_record: "Agregar Archivo" do |la|
        la.input :title, label: "Titulo"
        la.input :published_at, as: :datepicker, label: "Fecha"
        la.input :attachment, label: ""
      end
    end
    f.inputs "Agenda" do
      f.has_many :agendas, heading: "", allow_destroy: true, new_record: "Agregar Agenda" do |a|
        a.input :event_at, as: :datepicker, label: "Fecha"
        a.input :time, label: "Hora", minute_step: 30, ampm: true
        a.input :body, label: "Descripción", input_html: { rows: 6 }
        a.input :event_type, label: "Tipo de evento"
        a.input :plenary_commission, label: "Plenaria/Comisión"
        a.input :observation, label: "Observación", input_html: { rows: 6 }
      end
    end
    f.inputs do
      f.input :notify, label: "Envíar notificación?"
    end
    f.actions do
      f.action :submit, label: "Guardar Proyecto"
      li class: "cancel" do
        link_to "Cancelar", admin_legislatives_path
      end
    end
  end

  member_action :schedule, method: [:get, :post] do
    if request.post?
      @agenda = resource.agendas.new(permitted_params[:agenda])

      if @agenda.save
        redirect_to admin_legislatives_path, notice: "El proyecto ha sido agendado con éxito."
      end
    else
      @agenda = resource.agendas.new
    end
  end

  member_action :stakeholders, method: [:get, :post] do
    if request.post?
      authors = params[:stakeholders][:authors].delete_if(&:blank?)
      chamber_speakers = params[:stakeholders][:chamber_speakers].delete_if(&:blank?)
      senate_speakers = params[:stakeholders][:senate_speakers].delete_if(&:blank?)

      if params[:stakeholders][:notify] == '1'

        list_authors = []
        list_chamber_speakers = []
        list_senate_speakers = []
        
        authors.each do |stakeholder_id|
          if not resource.stakeholders.authors.map(&:id).include? stakeholder_id.to_i
            list_authors << stakeholder_id
          end
        end

        chamber_speakers.each do |stakeholder_id|
          if not resource.stakeholders.chamber_speakers.map(&:id).include? stakeholder_id.to_i
            list_chamber_speakers << stakeholder_id
          end
        end

        senate_speakers.each do |stakeholder_id|
          if not resource.stakeholders.senate_speakers.map(&:id).include? stakeholder_id.to_i
            list_senate_speakers << stakeholder_id
          end
        end

        UserMailer.set_recipients_stakeholder_notification(
          resource, list_authors, list_chamber_speakers, list_senate_speakers)
      end

      resource.legislative_stakeholders.destroy_all

      authors.each { |stakeholder_id| resource.legislative_stakeholders.authors.create!(stakeholder_id: stakeholder_id)  }
      chamber_speakers.each { |stakeholder_id| resource.legislative_stakeholders.chamber_speakers.create!(stakeholder_id: stakeholder_id)  }
      senate_speakers.each { |stakeholder_id| resource.legislative_stakeholders.senate_speakers.create!(stakeholder_id: stakeholder_id)  }

      redirect_to admin_legislative_path(resource), notice: "Stakeholders guardados con éxito."
    else
      @holders = Stakeholder.all.map { |e| [e.name, e.id] }
      if resource.legislative.present?
        @authors = resource.legislative.stakeholders.authors.map(&:id)
        @chamber_speakers = resource.legislative.stakeholders.chamber_speakers.map(&:id)
        @senate_speakers = resource.legislative.stakeholders.senate_speakers.map(&:id)
      else
        @authors = resource.stakeholders.authors.map(&:id)
        @chamber_speakers = resource.stakeholders.chamber_speakers.map(&:id)
        @senate_speakers = resource.stakeholders.senate_speakers.map(&:id)
      end
    end
  end

  action_item :stakeholders, only: :show do
    link_to "Modificar Stakeholders", stakeholders_admin_legislative_path(legislative), method: :get
  end

  action_item :pdf, only: :show do
    link_to "Exportar a PDF", legislative_path(legislative, format: :pdf), target: :_blank
  end

  # member_action :inactive, method: :put do
  #   resource.inactive!
  #   redirect_to admin_legislatives_path, notice: "El Proyecto ha sido eliminado."
  # end

  # action_item :inactive, only: :show do
  #   link_to "Inactive", inactive_admin_legislative_path(legislative), method: :put
  # end

  controller do
    def permitted_params
      params.permit legislative: [
        :title, :source, :chamber_number, :senate_number, :commission, :status, :final_status, :topic, :type_law, :probability, :chamber_commission_at, :chamber_plenary_at, :senate_commission_at, :senate_plenary_at, :filing_at, :warning, :law_number, :second_chamber_commission_at, :second_chamber_plenary_at, :second_senate_commission_at, :second_senate_plenary_at, :chamber_settlement_at, :senate_settlement_at, :notify,
        legislatives_attributes: [:id, :_destroy, :title, :source, :topic, :chamber_number, :senate_number, :status, :type_law, :filing_at, :final_status],
        attachments_attributes: [:id, :_destroy, :attachment, :title, :published_at],
        stakeholders: [:chamber_authors, :chamber_speakers, :senate_authors, :senate_speakers, :notify],
        agendas_attributes: [:id, :_destroy, :body, :event_at, :event_type, :time, :plenary_commission, :observation]],
        agenda: [:body, :event_at, :event_type, :time, :plenary_commission, :observation]
    end

    def new
      @page_title = "Agregar Proyecto"
      super
    end

    def edit
      @page_title = "Editar Proyecto"
    end
  end
end
