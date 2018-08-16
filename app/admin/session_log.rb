ActiveAdmin.register SessionLog do
  menu label: 'Logs de Inicio de Sesión', parent: 'Sistema', priority: 9
  actions :index

  filter :email, label: 'Email'
  filter :created_at, label: 'Fecha'

  index title: 'Inicios de Sesión' do
    column 'Email', :email
    column 'IP', :ip_address
    column 'Localidad', :location
    column 'Coordenadas', :coordinates
    column 'Conteo', :daily_sing_in_count
    column 'Creado', :created_at
    column 'Actualizado', :updated_at
  end
end
