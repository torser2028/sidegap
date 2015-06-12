ActiveAdmin.register Event do
  menu label: "Eventos", parent: "Rama Legislativa"
  actions :all, except: [:destroy]

  permit_params :body, :event_at, :event_type, :source, :time, :commission, :plenary

  filter :body, label: "Evento"
  filter :event_type, label: "Tipo de Evento"
  filter :event_at, label: "Fecha"

  index do
    selectable_column
    column "Evento", :body
    column "Fecha" do |event|
      ldate event.event_at
    end
    column "Hora" do |event|
      l event.time, format: :simple
    end
    column "Tipo de Noticia", :event_type
    actions
  end

  show title: "Detalle Evento" do |event|
    panel "Eventos" do
      attributes_table_for event do
        row "Evento" do
          simple_format event.body
        end
        row "Fecha" do
          ldate event.event_at
        end
        row "Hora" do
          l event.time, format: :simple
        end
        row "Tipo de Evento" do
          event.event_type
        end
        row "Comisión" do
          event.commission
        end
        row "Plenaria" do
          event.plenary
        end
        row "Fuente" do
          event.source
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :body, label: "Evento", input_html: { rows: 6 }
      f.input :event_at, as: :datepicker, label: "Fecha"
      f.input :time, label: "Hora", minute_step: 30, ampm: true
      f.input :event_type, label: "Tipo de Evento"
      f.input :commission, label: "Comisión"
      f.input :plenary, label: "Plenaria"
      f.input :source, label: "Fuente"
    end
    f.actions
  end
end
