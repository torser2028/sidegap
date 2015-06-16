ActiveAdmin.register Story do
  menu label: "Noticias"
  permit_params :title, :source, :body, :legislative_id
end
