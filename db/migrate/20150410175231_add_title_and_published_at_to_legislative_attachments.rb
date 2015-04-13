class AddTitleAndPublishedAtToLegislativeAttachments < ActiveRecord::Migration
  def change
    add_column :legislative_attachments, :title, :string
    add_column :legislative_attachments, :published_at, :date
  end
end
