ActiveAdmin.register Stakeholder do
  menu label: 'Congresistas', parent: 'Rama Legislativa'

  permit_params :name, :email, :phone, :address, :political_party, :job, :commission, :region, :office, :info, :source, :avatar, :status, stakeholders_periods_attributes: [:id, :period_id, :political_party, :job, :commission, :region, :_destroy]

  scope :active, default: true
  scope :inactive

  filter :name, label: 'Nombre'
  filter :political_party, label: 'Partido', as: :select, collection: -> { PoliticalParty.pluck(:name) }
  filter :commission, label: 'Comisión', as: :select, collection: -> { Commission.legislatives.pluck(:name) }
  filter :region, label: 'Región', as: :select, collection: -> { Region.pluck(:name) }

  index title: 'Congresistas' do
    selectable_column
    column 'Nombre', :name
    column 'Partido' do |stakeholder|
      stakeholder.stakeholders_periods.last.political_party
    end
    column 'Cargo' do |stakeholder|
      stakeholder.stakeholders_periods.last.job
    end
    column 'Comisión' do |stakeholder|
      stakeholder.stakeholders_periods.last.commission
    end
    column 'Región' do |stakeholder|
      stakeholder.stakeholders_periods.last.region
    end
    column 'Periodos', :stakeholders_periods do |f|
      f.show_periods
    end
    column 'Estado', :status
    actions
  end

  show title: 'Detalle Congresista' do
    panel 'Detalles' do
      attributes_table do
        row 'Imagen' do
          image_tag stakeholder.avatar_url, class: 'avatar'
        end
        row 'Nombre' do
          stakeholder.name
        end
        row :email
        row 'Partido Político' do
          stakeholder.stakeholders_periods.last.political_party
        end
        row 'Cargo' do
          stakeholder.stakeholders_periods.last.job
        end
        row 'Región' do
          stakeholder.stakeholders_periods.last.region
        end
        row 'Comisión' do
          simple_format stakeholder.stakeholders_periods.last.commission
        end
        row 'Teléfono' do
          stakeholder.stakeholders_periods.last.phone
        end
        row 'Dirección' do
          stakeholder.stakeholders_periods.last.address
        end
        row 'Oficina' do
          stakeholder.stakeholders_periods.last.office
        end
        row 'Pérfil' do
          simple_format stakeholder.info
        end
        row 'Fuente de Información' do
          link_to stakeholder.source, stakeholder.source
        end
        row 'Periodos' do 
          stakeholder.show_periods
        end
        row 'Estado' do
          stakeholder.status == true ? 'Activo' : 'Inactivo'
        end
      end
    end
    panel 'Periodos' do
      periods = stakeholder.stakeholders_periods
      table_for periods do
        column 'Periodo', :period do |p|
          p.period.name
        end
        column 'Partido', :political_party
        column 'Cargo', :job
        column 'Comisión', :commission
        column 'Región', :region
      end
    end
  end

  form do |f|
    f.inputs 'Detalles del congresista' do
      f.input :name, label: 'Nombre'
      f.input :email
      f.input :info, label: 'Pérfil'
      f.input :source, label: 'Fuente de Información'
      f.input :avatar, hint: f.object.avatar.present? \
        ? image_tag(f.object.avatar_url)
        : content_tag(:span, 'no tiene image')
      f.input :avatar_cache, as: :hidden
      f.input :status, label: 'Activo?'
    end
    f.inputs 'Periodos' do
      f.has_many :stakeholders_periods, heading: false, allow_destroy: false, new_record: true do |a|
        a.input :period, label: 'Periodo', as: :select, collection: Period.pluck(:id), input_html: { required: true }, :hint => f.template.content_tag(:span, Period.all.map {|p| "Selecione #{p.id} para el periodo #{p.name}"})
        a.input :political_party, label: 'Partido', collection: PoliticalParty.pluck(:name)
        a.input :job, label: 'Cargo', collection: Job.pluck(:name)
        a.input :commission, label: 'Comisión', collection: Commission.legislatives.pluck(:name)
        a.input :region, label: 'Región', collection: Region.pluck(:name)
        a.input :phone, label: 'Teléfono', input_html: { value: f.object.phone || '382 30 00' }
        a.input :address, label: 'Dirección', collection: Stakeholder::ADDRESSES
        a.input :office, label: 'Oficina'
        a.input :_destroy, as: :boolean
      end
    end
    f.actions do
      f.action :submit, label: 'Guardar Congresista'
      li class: 'cancel' do
        link_to 'Cancelar', admin_stakeholders_path
      end
    end
  end

  action_item :pdf, only: :show do
    link_to 'Exportar a PDF', stakeholder_legislatives_path(stakeholder, format: :pdf), target: :_blank
  end

  controller do
    def new
      @page_title = 'Agregar Congresista'
      super
    end

    def edit
      @page_title = 'Editar Congresista'
    end
  end
end
