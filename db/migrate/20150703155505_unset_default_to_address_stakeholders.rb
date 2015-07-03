class UnsetDefaultToAddressStakeholders < ActiveRecord::Migration
  def up
    change_column :stakeholders, :address, :string
  end

  def down
    change_column :stakeholders, :address, :string, default: "Capitolio Nacional, Calle 10 N° 7-50"
  end
end
