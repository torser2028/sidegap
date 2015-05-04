class ChangeInstitutionFromExecutives < ActiveRecord::Migration
  def change
    remove_column :executives, :institution
    
    add_column :executives, :institution_id, :integer
    add_index :executives, :institution_id
    add_foreign_key :executives, :institutions
  end
end
