ActiveAdmin.register User do
  menu label: 'Usuarios', parent: 'Sistema', priority: 0
  actions :all, except: [:destroy]

  filter :name
  filter :email
  filter :company
  filter :area
  filter :roles
  filter :active, collection: [['Si', true], ['No', false]]

  permit_params :name, :email, :company_id, :area, :job, :role_ids, :password, :password_confirmation, :bcc

  before_save do |user|
    user.roles.destroy_all
    roles = Role.find(params[:user][:role_ids].reject(&:empty?))
    roles.each { |role| user.roles << role unless user.roles.include?(role) }
  end

  index title: 'Usuarios' do
    selectable_column
    column 'Nombre', :name
    column 'Correo', :email
    column 'Compañía', :company
    column 'Área', :area
    column 'Fecha Creación', :created_at
    column 'Con copia a', :bcc
    actions defaults: true do |user|
      res = link_to 'Corre de Bienvenida', welcome_email_admin_user_path(user), class: 'member_link'
      if user.active
        res += link_to 'Desactivar', inactive_admin_user_path(user), class: 'member_link', method: :put
      else
        res += link_to 'Activar', active_admin_user_path(user), class: 'member_link', method: :put
      end
    end
  end

  show title: 'Detalles de Usuario' do
    attributes_table do
      row 'Nombre' do
        user.name
      end
      row 'Correo' do
        user.email
      end
      row 'Compaía' do
        user.company
      end
      row 'Área' do
        user.area
      end
      row 'Trabajo' do
        user.job
      end
      row 'Con copia a' do
        user.bcc
      end
      row :roles do |user|
        user.roles.pluck(:name).join(', ')
      end
      row 'Contraseña' do
        user.passwd
      end
      row 'Creación' do
        user.created_at
      end
      row 'Actualización' do
        user.updated_at
      end
      row 'Última decha de ingreso' do
        user.last_sign_in_at
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :name, label: 'Nombre:'
      f.input :email, label: 'Correo:'
      f.input :company, label: 'Compañía:'
      f.input :area, as: :select, collection: Area.pluck(:name)
      f.input :job, label: 'Trabajo:'
      f.input :bcc, label: 'Con copia a:'
      f.input :roles, as: :check_boxes, collection: Role.all
    end
    if f.object.new_record?
      f.inputs do
        f.input :password
        f.input :password_confirmation
      end
    end
    f.actions do
      f.action :submit, label: 'Guardar Usuario'
      li class: 'cancel' do
        link_to 'Cancelar', admin_users_path
      end
    end
  end

  member_action :active, method: :put do
    resource.active!
    redirect_to admin_users_path, notice: 'El usuario ha sido activado.'
  end

  member_action :inactive, method: :put do
    resource.inactive!
    redirect_to admin_users_path, notice: 'El usuario ha sido desactivado.'
  end

  member_action :welcome_email, method: :get do
    UserMailer.welcome(resource).deliver_now
    redirect_to admin_users_path, notice: 'El correo con las credenciales ha sido enviado.'
  end

  controller do
    def scoped_collection
      User.unscoped
    end

    def new
      @page_title = 'Agregar Usuario'
      super
    end

    def edit
      @page_title = 'Editar Usuario'
    end
  end
end
