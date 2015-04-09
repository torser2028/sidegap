class CreateLegislativeAttachments < ActiveRecord::Migration
  def change
    create_table :legislative_attachments do |t|
      t.string :attachment
      t.references :legislative, index: true

      t.timestamps null: false
    end
    add_foreign_key :legislative_attachments, :legislatives
  end
end
