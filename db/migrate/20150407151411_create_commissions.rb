class CreateCommissions < ActiveRecord::Migration
  def change
    create_table :commissions do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
