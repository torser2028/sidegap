ActiveAdmin.register RegulatoryAlert do
  menu label: "Alerta Regulatoria", priority: 5
  permit_params :title, :body, :filing_at

  filter :title, label: "Titulo"
  filter :body, label: "Descripción"
  filter :filing_at, label: "Fecha"

  index title: "Alerta Regulatoria" do
    column "Titulo", :title
    column "Descripción" do |regulatory_alert|
      simple_format regulatory_alert.body
    end
    column "Fecha" do |regulatory_alert|
      ldate regulatory_alert.filing_at
    end
    actions
  end

  show title: "Detalle de la alerta" do |regulatory_alert|
    panel "Detalles" do
      attributes_table_for regulatory_alert do
        row "Titulo" do
          regulatory_alert.title
        end
        row "Descripción" do
          simple_format regulatory_alert.body
        end
        row "Fecha" do
          ldate regulatory_alert.filing_at
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :title, label: "Titulo"
      f.input :body, label: "Descripción", input_html: { rows: 5 }
      f.input :filing_at, label: "Fecha", as: :datepicker
    end
    f.actions do
      f.action :submit, label: "Guardar Alerta Regulatoria"
      li class: "cancel" do
        link_to "Cancelar", admin_regulatory_alerts_path
      end
    end
  end
end
