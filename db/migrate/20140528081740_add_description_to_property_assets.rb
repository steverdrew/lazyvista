class AddDescriptionToPropertyAssets < ActiveRecord::Migration
  def change
    add_column :property_assets, :description, :string
  end
end
