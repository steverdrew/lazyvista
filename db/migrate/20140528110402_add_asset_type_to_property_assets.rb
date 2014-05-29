class AddAssetTypeToPropertyAssets < ActiveRecord::Migration
  def change
    add_column :property_assets, :asset_type, :string
    add_index :property_assets, :asset_type
  end
end
