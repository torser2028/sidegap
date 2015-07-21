class AddPlenaryCommissionToAgendas < ActiveRecord::Migration
  def change
    add_column :agendas, :plenary_commission, :string
  end
end
