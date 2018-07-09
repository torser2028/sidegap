class AddPhoneAddressAndOfficeToStakeholdersPeriod < ActiveRecord::Migration
  def change
    add_column :stakeholders_periods, :phone, :string
    add_column :stakeholders_periods, :address, :string
    add_column :stakeholders_periods, :office, :string
  end
end
