ActiveAdmin.register PoliticalParty do
  menu label: 'Partidos Politicos', parent: 'Rama Legislativa'
  permit_params :name

  filter :name, label: 'Nombre'

  index title: 'Partidos Politicos' do
    column 'Nombre', :name
    actions
  end

  show title: 'Detalle del Partido' do
    panel 'Detalles' do
      attributes_table_for political_party do
        row 'Nombre' do
          political_party.name
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :name, label: 'Nombre'
    end
    f.actions do
      f.action :submit, label: 'Guardar Partido'
      li class: 'cancel' do
        link_to 'Cancelar', :back
      end
    end
  end
end
