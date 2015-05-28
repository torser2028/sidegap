ActiveAdmin.register Company do
  menu label: "Empresas", parent: "Sistema", priority: 1

  permit_params :name
end
