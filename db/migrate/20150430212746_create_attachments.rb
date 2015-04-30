class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :attachment
      t.string :title
      t.date :published_at
      t.references :executive, index: true
      t.references :legislative, index: true

      t.timestamps null: false
    end
    add_foreign_key :attachments, :executives
    add_foreign_key :attachments, :legislatives
  end
end
