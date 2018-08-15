class AddMainEmailAndExtraEmailsFieldsToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :main_email, :string
    add_column :companies, :extra_emails, :string
  end
end
