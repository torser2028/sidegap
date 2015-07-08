class AddSenateSettlementAtAndChamberSettlementAtToLegislatives < ActiveRecord::Migration
  def change
    add_column :legislatives, :senate_settlement_at, :date
    add_column :legislatives, :chamber_settlement_at, :date
  end
end
