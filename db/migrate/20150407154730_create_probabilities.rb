class CreateProbabilities < ActiveRecord::Migration
  def change
    create_table :probabilities do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
