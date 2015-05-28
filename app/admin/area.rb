ActiveAdmin.register Area do
  menu parent: "Sistema", priority: 2

  permit_params :name
end
