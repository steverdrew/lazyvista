class AddIndexToPropertyAssets < ActiveRecord::Migration
  def change
    add_index :property_assets, :property_id
  end
end
