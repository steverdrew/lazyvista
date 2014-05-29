class AddPropertyIdToPropertyAssets < ActiveRecord::Migration
  def change
    add_column :property_assets, :property_id, :integer
  end
end
