ActiveAdmin.register RemovedAgenda do
  menu label: 'Agendas Desactivados', parent: 'Sistema', priority: 10
  actions :index

  index title: 'Agendas Desactivados' do
    column 'IDS', :agendas_ids
    column 'Día', :day
    column 'Fecha de desactivación', :created_at
  end
end
