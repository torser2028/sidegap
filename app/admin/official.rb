ActiveAdmin.register Official do
  menu label: "Altos Funcionarios", parent: "Rama Ejecutiva", priority: 1
  actions :all, except: [:destroy]

  permit_params :name, :email, :phone, :address, :institution_id, :job, :office, :info, :source, :avatar

  filter :job, label: "Cargo"
  filter :institution, label: "Institución"

  index title: "Altos Funcionarios" do
    selectable_column
    column "Nombre", :name
    column "Cargo", :job
    column "Institución", :institution
    column "Dirección", :address
    column "Teléfono", :phone
    actions
  end

  show do |official|
    panel "Detalles" do
      attributes_table_for official do
        row "Imagen" do
          image_tag official.avatar_url(:thumb)
        end
        row "Nombre" do
          official.name
        end
        row :email
        row "Teléfono" do
          official.phone
        end
        row "Dirección" do
          official.address
        end
        row "Institución" do
          official.institution
        end
        row "Cargo" do
          official.job
        end
        row "Oficina" do
          official.office
        end
        row "Pérfil" do
          simple_format official.info
        end
        row "Fuente de Información" do
          link_to official.source, official.source
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :name, label: "Nombre"
      f.input :email
      f.input :phone, label: "Teléfono"
      f.input :address, label: "Dirección"
      f.input :institution, label: "Institución", collection: option_groups_from_collection_for_select(Sector.all, :institutions, :name, :id, :name, f.object.institution.try(:id))
      f.input :job, label: "Cargo"
      f.input :office, label: "Oficina"
      f.input :info, label: "Pérfil"
      f.input :source, label: "Fuente de Información"
      f.input :avatar, hint: f.object.avatar.present? \
        ? image_tag(f.object.avatar_url(:thumb))
        : content_tag(:span, "no tiene image")
      f.input :avatar_cache, as: :hidden
    end
    f.actions
  end
end
