ActiveAdmin.register Story do
  menu label: "Noticias", priority: 4
  permit_params :title, :source, :body, :project_rule

  filter :title, label: "Titulo"
  filter :body, label: "Descripción"
  filter :source, label: "Fuente"

  index title: "Noticias" do
    column "Titulo", :title
    column "Descripción" do |story|
      simple_format story.body
    end
    column "Fuente", :source
    column "Proyecto / Norma" do |story|
      link_to story.project_rule, story.project_rule
    end
    actions
  end

  show title: "Detalle de la Noticia" do
    panel "Detalles" do
      attributes_table_for story do
        row "Titulo" do
          story.title
        end
        row "Descripción" do
          story.body
        end
        row "Fuente" do
          story.source
        end
        row "Proyecto / Norma" do
          link_to story.project_rule, story.project_rule
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :title, label: "Titulo"
      f.input :body, label: "Descripción"
      f.input :source, label: "Fuente"
      f.input :project_rule, label: "Proyecto / Norma"
    end
    f.actions do
      f.action :submit, label: "Guardar Noticia"
      li class: "cancel" do
        link_to "Cancelar", :back
      end
    end
  end
end
