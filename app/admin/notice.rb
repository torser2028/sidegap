ActiveAdmin.register Notice do
  menu label: "Noticias Cliente"

  filter :body, label: "Contenido"

  index title: "Noticias Cliente" do
    column "Contenido", :body
    column "Cliente" do |notice|
      notice.user.name
    end
    actions()
  end

  show title: "Detalle de la Noticia" do |notice|
    panel "Detalles" do
      attributes_table_for notice do
        row "Contenido" do
          notice.body
        end
        row "Cliente" do
          notice.user
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :body, label: "Contenido", as: :text
      f.input :user_id, as: :select, collection: User.active.clients.order(name: :asc).map{|c| ["#{c.name} - #{c.email}", c.id]}
    end
    f.actions do
      f.action :submit, label: "Guardar Noticia"
      li class: "cancel" do
        link_to "Cancelar", admin_notices_path
      end
    end
  end

  controller do
    def permitted_params
      params.permit notice: [:body, :user_id]
    end

    def new
      @page_title = "Agregar Noticia"
      super
    end

    def edit
      @page_title = "Editar Noticia"
    end
  end

end
