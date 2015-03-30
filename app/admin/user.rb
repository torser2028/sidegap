ActiveAdmin.register User do
  menu label: "Usuarios"

  filter :name
  filter :email
  filter :company
  filter :area
  filter :roles

  permit_params :name, :email, :company_id, :area_id, :job, :role_ids, :password,:password_confirmation

  before_save do |user|
    user.roles.destroy_all
    roles = Role.find(params[:user][:role_ids].reject(&:empty?))
    roles.each { |role| user.roles << role unless user.roles.include?(role)  }
  end

  index do
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
    actions
  end

  show do
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
      f.input :area, as: :select, collection: User::AREAS
      f.input :job
      f.input :roles, as: :check_boxes, collection: Role.all
    end
    if f.object.new_record?
      f.inputs do
        f.input :password
        f.input :password_confirmation
      end
    end
    f.actions
  end

end
