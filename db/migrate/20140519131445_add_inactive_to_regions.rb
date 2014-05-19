class AddInactiveToRegions < ActiveRecord::Migration
  def change
    add_column :regions, :inactive, :boolean, :default => true
  end
end
