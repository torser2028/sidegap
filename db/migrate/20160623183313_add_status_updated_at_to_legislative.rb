class AddStatusUpdatedAtToLegislative < ActiveRecord::Migration
  def change
  	add_column :legislatives, :status_updated_at, :datetime

  	Legislative.all.each do |legislative|
  		legislative.status_updated_at = legislative.updated_at
  		legislative.save
  	end
  end
end
