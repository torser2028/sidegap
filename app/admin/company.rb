ActiveAdmin.register Company do
  menu label: "Empresas", parent: "Sistema", priority: 1

  permit_params :name, :avatar

  index title: "Empresas" do
    column "Logo" do |company|
      image_tag company.avatar_url
    end
    column :name
    actions
  end
  show title: "Detalle Empresa" do |company|
    panel "Detalles" do
      attributes_table_for company do
        row "Logo" do
          image_tag company.avatar_url
        end
        row "Nombre" do
          company.name
        end
        row "Primer correo" do
          company.email_1
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :name, label: "Nombre"
      f.input :avatar, hint: f.object.avatar.present? \
        ? image_tag(f.object.avatar_url)
        : content_tag(:span, "no tiene image")
      f.input :avatar_cache, as: :hidden
    end
    f.actions do
      f.action :submit, label: "Guardar Empresa"
      li class: "cancel" do
        link_to "Cancelar", admin_companies_path
      end
    end
  end

end
