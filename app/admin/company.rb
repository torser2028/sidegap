ActiveAdmin.register Company do
  menu label: "Empresas", parent: "Sistema", priority: 1

  permit_params :name, :avatar, :main_email, :extra_emails

  index title: "Empresas" do
    column "Logo" do |company|
      image_tag company.avatar_url
    end
    column :name
    column :main_email
    column :extra_emails
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
        row 'Correo Principal' do
          company.main_email
        end
        row 'Correos Secundarios' do
          company.extra_emails
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :name, label: "Nombre"
      # f.input :email_1, label: "Primer correo"
      # f.input :email_2, label: "Segundo correo"
      # f.input :email_3, label: "Tercer correo"
      # f.input :email_4, label: "Cuarto correo"
      # f.input :email_5, label: "Quinto correo"
      f.input :main_email, label: "Correo principal"
      f.input :extra_emails, label: "Correos secundarios", hint: "Escribir los correos separados por comas Ej: jose@correo.com, maria@correo.com"
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
