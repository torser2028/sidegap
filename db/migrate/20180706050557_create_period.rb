class CreatePeriod < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.string :period
      t.boolean :status
    end
  end
end
