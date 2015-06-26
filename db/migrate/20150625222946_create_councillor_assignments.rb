class CreateCouncillorAssignments < ActiveRecord::Migration
  def change
    create_table :councillor_assignments do |t|
      t.references :council, index: true
      t.references :councillor, index: true
      t.boolean :author, default: false
      t.boolean :speaker, default: false

      t.timestamps null: false
    end
    add_foreign_key :councillor_assignments, :councils
    add_foreign_key :councillor_assignments, :councillors
  end
end
