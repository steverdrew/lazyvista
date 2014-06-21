class AddAudienceIdToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :audience_id, :integer
    add_index :properties, :audience_id

  end
end
