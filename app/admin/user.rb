ActiveAdmin.register User do

  index do
    selectable_column
    column :email
    column :roles do |user|
      user.roles.map(&:name).join(' ')
    end
    column :created_at
    actions
  end

end
