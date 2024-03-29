ActiveAdmin.register Rule do
  menu label: 'Normas', parent: 'Normas en Proceso de Consulta', priority: 0

  action_item only: %i[index] do
    link_to 'Exportar Normas de Hoy', export_xls_rules_path(format: :xlsx, type: 'daily')
  end

  action_item only: %i[index] do
    link_to 'Exportar Normas Activas', export_xls_rules_path(format: :xlsx, type: 'active')
  end

  action_item only: %i[index] do
    link_to 'Exportar Todas', export_xls_rules_path(format: :xlsx, type: 'all')
  end

  permit_params :title, :kind, :institution_id, :filing_at, :deadline_comments, :for_comments,
                attachments_attributes: %i[id _destroy attachment title published_at]

  csv force_quotes: true, col_sep: ',', column_names: true do
    column('Titulo', &:title)
    column('Tipo de norma', &:kind)
    column('Institución', &:institution_id)
    column('Fecha de creación', &:filing_at)
    column('Fecha limite para comentarios', &:deadline_comments)
    column('Comentarios', &:for_comments)
    column('Ruta') { |rule| 'https://app.sidegap.com/admin/rules/' + rule.id.to_s }
  end

  filter :title, label: 'Titulo'
  filter :kind, label: 'Tipo de Norma', as: :select, collection: -> { Kind.rules.pluck(:name) }
  filter :institution, label: 'Institución', as: :select, collection: -> { Institution.rules }
  filter :filing_at, label: 'Fecha de Creación'

  scope 'Próximas Normas', :active
  scope 'Normas Pasadas', :inactive
  scope 'Normas Activas', :status_active
  scope 'Normas Inactivas', :status_inactive

  index title: 'Normas' do
    selectable_column
    column 'Titulo', :title
    column 'Tipo de Norma', :kind
    column 'Institución', :institution
    column 'Fecha de Creación' do |rule|
      ldate rule.filing_at
    end
    column 'Estado' do |rule|
      rule.status ? 'Activo' : 'Inactivo'
    end
    actions
  end

  show title: 'Detalle de la Norma' do |rule|
    panel 'Detalles' do
      attributes_table_for rule do
        row 'Titulo' do
          rule.title
        end
        row 'Tipo de Norma' do
          rule.kind
        end
        row 'Sector' do
          rule.institution.try(:sector)
        end
        row 'Institución' do
          rule.institution
        end
        row 'Fecha de Creación' do
          ldate rule.filing_at
        end
        row 'Fecha Limite para Comentarios' do
          ldate rule.deadline_comments
        end
        row 'Comentarios / Sugerencias' do
          rule.for_comments
        end
        row 'Estado' do
          rule.status ? 'Activo' : 'Inactivo'
        end
        row 'Archivos Adjuntos' do
          table_for rule.attachments do
            column 'Nombre', :title do |a|
              link_to a.title, a.attachment.url
            end
            column 'Fecha', :published_at do |a|
              ldate a.published_at
            end
          end
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :title, label: 'Titulo', input_html: { rows: 5 }
      f.input :kind, label: 'Tipo de Norma', collection: Kind.rules.pluck(:name)
      f.input :institution, label: 'Institución', collection: Institution.rules
      f.input :filing_at, label: 'Fecha de Creación', as: :datepicker
      f.input :deadline_comments, label: 'Fecha Limite para Comentarios', as: :datepicker
      f.input :for_comments, label: 'Comentarios / Sugerencias', placeholder: 'Email / Teléfono'
      f.input :status, label: 'Activa?'
    end
    f.inputs 'Archivos Adjuntos' do
      f.has_many :attachments, heading: '', allow_destroy: true, new_record: 'Agregar Archivo' do |la|
        la.input :title, label: 'Titulo'
        la.input :published_at, as: :datepicker, label: 'Fecha'
        la.input :attachment, label: ''
      end
    end
    f.actions do
      f.action :submit, label: 'Guardar Norma'
      li class: 'cancel' do
        link_to 'Cancelar', admin_rules_path
      end
    end
  end

  controller do
    def new
      @page_title = 'Agregar Norma'
      super
    end

    def edit
      @page_title = 'Editar Norma'
    end
  end
end
