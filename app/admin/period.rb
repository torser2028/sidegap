ActiveAdmin.register Period do
  menu label: "Periodos", parent: "Sistema", priority: 5
  permit_params :name, :status
end
