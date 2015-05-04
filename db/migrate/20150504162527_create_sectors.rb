class CreateSectors < ActiveRecord::Migration
  def change
    create_table :sectors do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
