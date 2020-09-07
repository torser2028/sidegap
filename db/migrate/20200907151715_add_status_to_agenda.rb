class AddStatusToAgenda < ActiveRecord::Migration
  def change
    add_column :agendas, :status, :boolean, default: true
  end
end
