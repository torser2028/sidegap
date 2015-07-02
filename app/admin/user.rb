ActiveAdmin.register User do
  menu label: "Usuarios", parent: "Sistema", priority: 0
  actions :all, except: [:destroy]

  filter :name
  filter :email
  filter :company
  filter :area
  filter :roles
  filter :active, collection: [["Si", true], ["No", false]]

  permit_params :name, :email, :company_id, :area, :job, :role_ids, :password,:password_confirmation

  before_save do |user|
    user.roles.destroy_all
    roles = Role.find(params[:user][:role_ids].reject(&:empty?))
    roles.each { |role| user.roles << role unless user.roles.include?(role)  }
  end

  index title: "Usuarios" do
    selectable_column
    column :name
    column :email
    column :company
    column :area
    column :job
    column :roles do |user|
      user.roles.pluck(:name).join(', ')
    end
    column :created_at
    actions defaults: true do |user|
      if user.active
        link_to "Desactivar", inactive_admin_user_path(user), class: "member_link", method: :put
      else
        link_to "Activar", active_admin_user_path(user), class: "member_link", method: :put
      end
    end
  end

  show title: "Detalle de Usuario" do
    attributes_table do
      row :name
      row :email
      row :company
      row :area
      row :job
      row :roles do |user|
        user.roles.pluck(:name).join(', ')
      end
      row :created_at
      row :updated_at
      row :last_sign_in_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :company
      f.input :area, as: :select, collection: Area.pluck(:name)
      f.input :job
      f.input :roles, as: :check_boxes, collection: Role.all
    end
    if f.object.new_record?
      f.inputs do
        f.input :password
        f.input :password_confirmation
      end
    end
    f.actions do
      f.action :submit, label: "Guardar Usuario"
      li class: "cancel" do
        link_to "Cancelar", admin_users_path
      end
    end
  end

  member_action :active, method: :put do
    resource.active!
    redirect_to admin_users_path, notice: "El usuario ha sido activado."
  end

  member_action :inactive, method: :put do
    resource.inactive!
    redirect_to admin_users_path, notice: "El usuario ha sido desactivado."
  end

  controller do
    def new
      @page_title = "Agregar Usuario"
      super
    end

    def edit
      @page_title = "Editar Usuario"
    end
  end

end
