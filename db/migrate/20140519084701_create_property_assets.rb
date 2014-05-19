class CreatePropertyAssets < ActiveRecord::Migration
  def change
    create_table :property_assets do |t|

      t.timestamps
    end
  end
end
