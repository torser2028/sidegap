ActiveAdmin.register Event do
  menu label: 'Eventos', parent: 'Rama Legislativa'

  permit_params :body, :event_at, :event_type, :time, :commission, :plenary, :place, :observation, :status

  filter :body, label: 'Evento'
  filter :event_type, label: 'Tipo de Evento'
  filter :event_at, label: 'Fecha'

  scope 'Todo', :status_active, default: true
  scope 'Próximos Eventos', :active
  scope 'Eventos Pasados', :inactive
  scope 'Eventos Activas', :status_active
  scope 'Eventos Inactivas', :status_inactive

  index title: 'Eventos' do
    selectable_column
    column 'Evento', :body
    column 'Fecha' do |event|
      ldate event.event_at
    end
    column 'Hora' do |event|
      l event.time, format: :simple
    end
    column 'Tipo de Evento', :event_type
    column 'Estado' do |agenda|
      agenda.status ? 'Activo' : 'Inactivo'
    end
    actions
  end

  show title: 'Detalle Evento' do |event|
    panel 'Eventos' do
      attributes_table_for event do
        row 'Evento' do
          simple_format event.body
        end
        row 'Fecha' do
          ldate event.event_at
        end
        row 'Hora' do
          l event.time, format: :simple
        end
        row 'Tipo de Evento' do
          event.event_type
        end
        row 'Comisión' do
          event.commission
        end
        row 'Plenaria' do
          event.plenary
        end
        row 'Lugar' do
          event.place
        end
        row 'Observación' do
          event.observation
        end
        row 'Estado' do
          event.status ? 'Activo' : 'Inactivo'
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :body, label: 'Evento', input_html: { rows: 6 }
      f.input :event_at, as: :datepicker, label: 'Fecha'
      f.input :time, label: 'Hora', minute_step: 30, ampm: true
      f.input :event_type, label: 'Tipo de Evento'
      f.input :commission, label: 'Comisión'
      f.input :plenary, label: 'Plenaria'
      f.input :place, label: 'Lugar'
      f.input :observation, label: 'Observación', input_html: { rows: 6 }
      f.input :status, label: 'Activo?'
    end
    f.actions do
      f.action :submit, label: 'Guardar Evento'
      li class: 'cancel' do
        link_to 'Cancelar', admin_events_path
      end
    end
  end
  controller do
    def new
      @page_title = 'Agregar Evento'
      super
    end

    def edit
      @page_title = 'Editar Evento'
    end
  end
end
