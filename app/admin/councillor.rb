ActiveAdmin.register Councillor do
  menu label: "Concejales", parent: "Concejo", priority: 1
  actions :all, except: [:destroy]

  permit_params :name, :email, :phone, :address, :political_party, :job, :commission, :office, :info, :source, :avatar

  filter :name, label: "Nombre"
  filter :political_party, label: "Partido", as: :select, collection: -> { PoliticalParty.pluck(:name) }
  filter :commission, label: "Comisión", as: :select, collection: -> { Commission.pluck(:name) }

  index do
    selectable_column
    column "Nombre", :name
    column "Partido", :political_party
    column "Comisión", :commission
    actions
  end

  show title: "Detalle Concejal" do |councillor|
    panel "Detalles" do
      attributes_table_for councillor do
        row "Imagen" do
          image_tag councillor.avatar_url(:thumb)
        end
        row "Nombre" do
          councillor.name
        end
        row :email
        row "Teléfono" do
          councillor.phone
        end
        row "Dirección" do
          councillor.address
        end
        row "Partido" do
          councillor.political_party
        end
        row "Cargo" do
          councillor.job
        end
        row "Comisión" do
          councillor.commission
        end
        row "Oficina" do
          councillor.office
        end
        row "Pérfil" do
          simple_format councillor.info
        end
        row "Fuente de Información" do
          link_to councillor.source, councillor.source
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
      f.input :job, label: "Cargo", input_html: { value: "Concejal", readonly: true }
      f.input :commission, label: "Comisión", collection: Commission.pluck(:name)
      f.input :office, label: "Oficina"
      f.input :info, label: "Pérfil"
      f.input :source, label: "Fuente de Información"
      f.input :avatar, hint: f.object.avatar.present? \
        ? image_tag(f.object.avatar_url(:thumb))
        : content_tag(:span, "no tiene imagen")
      f.input :avatar_cache, as: :hidden
    end
    f.actions
  end
end
