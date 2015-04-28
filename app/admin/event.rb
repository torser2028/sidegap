ActiveAdmin.register Event do
  menu label: "Eventos", parent: "Rama Legislativa"
  actions :all, except: [:destroy]

  permit_params :body, :event_at, :event_type, :source

  index do
    selectable_column
    column "Evento", :body
    column "Fecha", :event_at
    column "Tipo de Noticia", :event_type
    actions
  end

  show title: "Detalle Evento" do |event|
    panel "Eventos" do
      attributes_table_for event do
        row "Evento" do
          event.body
        end
        row "Fecha" do
          event.event_at
        end
        row "Tipo de Evento" do
          event.event_type
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
      f.input :event_type, label: "Tipo de Evento"
      f.input :source, label: "Fuente"
    end
    f.actions
  end
end
