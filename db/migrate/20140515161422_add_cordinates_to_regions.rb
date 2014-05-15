class AddCordinatesToRegions < ActiveRecord::Migration
  def change
    add_column :regions, :lat, :decimal
    add_column :regions, :lng, :decimal
  end
end
