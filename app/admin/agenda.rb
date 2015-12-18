ActiveAdmin.register Agenda do
  menu label: "Proyectos Agendados", parent: "Rama Legislativa", priority: 2
  actions :index

  permit_params :body, :event_type, :event_at, :time, :plenary_commission

  filter :body, label: "Descripción"
  filter :event_type, label: "Tipo de evento"
  filter :event_at, label: "Fecha"
  filter :plenary_commission, label: "Plenaria/Comisión"

  scope "Todo", :all, default: true
  scope "Próxima Agenda", :active
  scope "Agenda Pasada", :inactive

  index title: "Proyectos Agendados" do
    column "Proyecto" do |agenda|
      simple_format agenda.legislative.title
    end
    column "Núm. Cámara" do |agenda|
      simple_format agenda.legislative.chamber_number
    end
    column "Núm. Senado" do |agenda|
      simple_format agenda.legislative.senate_number
    end
    column "Descripción", :body
    column "Tipo de evento", :event_type
    column "Fecha" do |agenda|
      ldate agenda.event_at
    end
    column "Hora" do |agenda|
      l agenda.time, format: :simple
    end
    column "Plenaria/Comisión", :plenary_commission
    actions do |agenda|
      link_to "Ver Proyecto", admin_legislative_path(agenda.legislative)
    end
  end
end
