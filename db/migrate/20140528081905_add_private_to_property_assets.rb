class AddPrivateToPropertyAssets < ActiveRecord::Migration
  def change
    add_column :property_assets, :private, :boolean
  end
end
