ActiveAdmin.register Story do
  menu label: "Noticias", priority: 4
  permit_params :title, :source, :body, :legislative_id
end
