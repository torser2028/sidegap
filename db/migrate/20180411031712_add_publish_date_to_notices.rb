class AddPublishDateToNotices < ActiveRecord::Migration
  def change
    add_column :notices, :publish_date, :datetime
  end
end
