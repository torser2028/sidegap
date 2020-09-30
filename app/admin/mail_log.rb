ActiveAdmin.register MailLog do
  menu label: 'Correos Enviados', parent: 'Sistema', priority: 0
  actions :index

  permit_params :email, :subject, :options, :created_at

  filter :email, label: 'Correo'
  filter :subject, label: 'Asunto del correo'
  filter :options, label: 'Más información'
  filter :created_at, label: 'Fecha de envío'

  index title: 'Correos Enviados' do
    column 'Descripción', :email
    column 'Tipo de evento', :subject
    column 'Más información', :options
    column 'Fecha de envío', :created_at
  end
end
