class AddRegionIdToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :region_id, :integer
    add_index :places, :region_id
  end
end
