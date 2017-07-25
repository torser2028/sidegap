class AddEmailsToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :email_1, :string
    add_column :companies, :email_2, :string
    add_column :companies, :email_3, :string
    add_column :companies, :email_4, :string
    add_column :companies, :email_5, :string
  end
end
