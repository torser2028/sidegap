class CreateOfficials < ActiveRecord::Migration
  def change
    create_table :officials do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.string :job
      t.string :office
      t.string :source
      t.text :info
      t.string :avatar
      t.references :institution, index: true

      t.timestamps null: false
    end
    add_foreign_key :officials, :institutions
  end
end
