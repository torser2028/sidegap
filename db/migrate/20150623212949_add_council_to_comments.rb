class AddCouncilToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :council, index: true
    add_foreign_key :comments, :councils
  end
end
