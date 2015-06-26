class CreateCouncillors < ActiveRecord::Migration
  def change
    create_table :councillors do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.string :political_party
      t.string :job
      t.string :commission
      t.string :office
      t.text :info
      t.string :source
      t.string :avatar

      t.timestamps null: false
    end
  end
end
