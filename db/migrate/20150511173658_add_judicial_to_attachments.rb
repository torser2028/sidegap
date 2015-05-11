class AddJudicialToAttachments < ActiveRecord::Migration
  def change
    add_reference :attachments, :judicial, index: true
    add_foreign_key :attachments, :judicials
  end
end
