ActiveAdmin.register RemovedEvent do
  menu label: 'Eventos Desactivadas', parent: 'Sistema', priority: 10
  actions :index

  index title: 'Eventos Desactivadas' do
    column 'IDS', :events_ids
    column 'Día', :day
    column 'Fecha de desactivación', :created_at
  end
end
