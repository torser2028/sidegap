class AddSecondSenateCommissionAtAndSecondSenatePlenaryAtAndSecondChamberCommissionAtAndSecondChamberPlenaryAtToLegislatives < ActiveRecord::Migration
  def change
    add_column :legislatives, :second_senate_commission_at, :date
    add_column :legislatives, :second_senate_plenary_at, :date
    add_column :legislatives, :second_chamber_commission_at, :date
    add_column :legislatives, :second_chamber_plenary_at, :date
  end
end
