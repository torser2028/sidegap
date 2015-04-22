class AddAvatarToStakeholders < ActiveRecord::Migration
  def change
    add_column :stakeholders, :avatar, :string
  end
end
