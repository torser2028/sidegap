class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :name
      t.references :sector, index: true

      t.timestamps null: false
    end
    add_foreign_key :institutions, :sectors
  end
end
