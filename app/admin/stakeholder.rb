ActiveAdmin.register Stakeholder do
  menu label: "Congresistas", parent: "Rama Legislativa"
  actions :all, except: [:destroy]

  permit_params :name, :email, :phone, :address, :political_party, :job, :commission, :region, :office, :info, :source, :avatar

  index do
    selectable_column
    column "Nombre", :name
    column "Partido", :political_party
    column "Comisión", :commission
    column "Región", :region
    actions
  end

  show title: "Detalle Congresista" do |stakeholder|
    panel "Detalles" do
      attributes_table_for stakeholder do
        row "Imagen" do
          image_tag stakeholder.avatar_url(:thumb)
        end
        row "Nombre" do
          stakeholder.name
        end
        row :email
        row "Teléfono" do
          stakeholder.phone
        end
        row "Dirección" do
          stakeholder.address
        end
        row "Partido" do
          stakeholder.political_party
        end
        row "Cargo" do
          stakeholder.job
        end
        row "Comisión" do
          stakeholder.commission
        end
        row "Región" do
          stakeholder.region
        end
        row "Oficina" do
          stakeholder.office
        end
        row "Pérfil" do
          simple_format stakeholder.info
        end
        row "Fuente de Información" do
          link_to stakeholder.source, stakeholder.source
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
      f.input :political_party, label: "Partido", collection: PoliticalParty.pluck(:name)
      f.input :job, label: "Cargo"
      f.input :commission, label: "Comisión", collection: Commission.pluck(:name)
      f.input :region, label: "Región", collection: Region.pluck(:name)
      f.input :office, label: "Oficina"
      f.input :info, label: "Pérfil"
      f.input :source, label: "Fuente de Información"
      f.input :avatar
    end
    f.actions
  end
end