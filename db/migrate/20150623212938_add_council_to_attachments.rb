class AddCouncilToAttachments < ActiveRecord::Migration
  def change
    add_reference :attachments, :council, index: true
    add_foreign_key :attachments, :councils
  end
end
