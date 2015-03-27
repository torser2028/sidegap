ActiveAdmin.register Story do
  menu label: "Noticias"
  permit_params :title, :source, :body
end
