class AddRuleToAttachments < ActiveRecord::Migration
  def change
    add_reference :attachments, :rule, index: true
    add_foreign_key :attachments, :rules
  end
end
