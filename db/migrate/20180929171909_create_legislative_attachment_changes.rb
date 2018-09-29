class CreateLegislativeAttachmentChanges < ActiveRecord::Migration
  def change
    create_table :legislative_attachment_changes do |t|
      t.references :legislative, index: true
      t.references :attachment, index: true
      t.datetime :date

      t.timestamps null: false
    end
    add_foreign_key :legislative_attachment_changes, :legislatives
    add_foreign_key :legislative_attachment_changes, :attachments
  end
end
