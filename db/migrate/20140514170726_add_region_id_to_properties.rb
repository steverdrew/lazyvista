class AddRegionIdToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :region_id, :integer
    add_column :properties, :country_id, :integer
    add_index :properties, :region_id
    add_index :properties, :country_id
  end
end
