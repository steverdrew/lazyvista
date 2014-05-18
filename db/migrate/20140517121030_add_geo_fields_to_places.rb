class AddGeoFieldsToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :lat, :decimal
    add_column :places, :lng, :decimal
    add_column :places, :zoom, :integer
  end
end
